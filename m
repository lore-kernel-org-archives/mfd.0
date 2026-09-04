Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40A423A9B
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 06:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505076; cv=none; b=X84ZsDm9WbKJvQ2hUpeWZR8CDYe09kNzSix6ZpCL4CgAOdTHzVi8bF0AlAZ5Q2j5XoejHzcz70pG39gOJbPOF5cA7Q4hlp9/J0ay+jfXFR9buIeJzCJmlLvGoFqxzku4IggRUgVZo3Rt8oeYPlDn2kbE9ES7wVkTmPVr3DbP6L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505076; c=relaxed/simple;
	bh=TLJZ8X+u8QFS3pvzfr7f3WBFiYtJbiygl39BaKFU5DQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eBlIHKEGRXM8frDKXvVNvDbyIJva0+3s0+jPvCrah6KF0b7grG1LQAwLaMa5mI/nlyypcoMDXVQaIJ6Rwvpi90VsOoSUhYeR1n7E/EiNF9MzDNXsqp5TD2jimAE8rgM3jCvDia4lXHTqySNTlmWRuprPBeFTpmtF67ieQi9dTbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvSJBEwz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvSJBEwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFB31F00A3D;
	Fri,  4 Sep 2026 06:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505074;
	bh=2NBexdNexn1Y8CNnnH2+FsOGv80Dn+ArZwhTr12FZy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gvSJBEwzgj5HmfzkmbetmE1n6Q+zeWWTLTWr7Qa0jXn+o1+JTm73stIXakeWaFDcA
	 JeasXUU7OqYTJ8sPguHEVEK/eeMI23EoR7J9o6z/tU8oa2Ay8VKrv99cqaAj+X7DCG
	 0mOeL0TtPGDKCsUv9eIgkz22Q0b+bShC67thXldGq9hDrHIxXqmnfXgmlJ6iGz2Cm9
	 DGRVlpdtbu325r6WV12zbjoM0ovyRHC9oq5GHypGYbaAatAHJADtKofCikXyiTs+Yg
	 geWCsgozEsRvTSch+y+T1fiH4NOo3uwjzHOe3NK2wAhN1qZ8LgcagT1WQg/qTjLM6s
	 q9O5DAX2OxWJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] mfd: tps65217: Use devres for IRQ domain and
 wake teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260904063439.69881-4-r.zhambakiev@prosoftsystems.ru>
References: <20260904063439.69881-1-r.zhambakiev@prosoftsystems.ru>
 <20260904063439.69881-4-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:57:54 +0000
Message-Id: <20260904065754.9CFB31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global static `mfd_cell` array `tps65217s` is dynamically muta=
ted during probe, which violates MFD subsystem guidelines and corrupts plat=
form data for subsequent probes.
--

commit 5ed0fd0cf78137c5505f644659e59027eb7df6d2
Author: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

mfd: tps65217: Use devres for IRQ domain and wake teardown

This commit registers the IRQ domain teardown and disable_irq_wake() as
devres actions instead of manually cleaning them up in the remove callback.
It ensures that MFD children release their IRQs before the parent interrupt
is freed and the domain is torn down, fixing a use-after-free issue.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 9a1528456ffc2..2d799b60c79b4 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
[ ... ]
> @@ -380,22 +429,6 @@ static int tps65217_probe(struct i2c_client *client)
>  	return 0;
>  }
> =20

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed a potential issue with how the global MFD cell array is handled in
tps65217_probe().

Does tps65217_probe() persistently corrupt platform data if a device without
an assigned IRQ is probed?

The global array is defined as:

static struct mfd_cell tps65217s[] =3D {

If client->irq is 0, tps65217_probe() mutates this shared array:

	} else {
		int i;

		/* Don't tell children about IRQ resources which won't fire */
		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
			tps65217s[i].num_resources =3D 0;
	}

Because this array is shared, modifying it zeroes out the resources for all
subsequent probes of tps65217 devices, or even for the same device if its
probe defers and is retried later.

Should tps65217s be declared as static const to prevent this, and should
this dynamic modification be avoided?

> -static void tps65217_remove(struct i2c_client *client)
> -{
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904063439.6988=
1-1-r.zhambakiev@prosoftsystems.ru?part=3D3
