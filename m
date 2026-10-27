Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092756;
	b=ooLF7JxIihi0ZHwB/jU3TuSoYXFhzWpGVVGxKn+IxdNCcFTcC20mvSLaLUD9TBrlLweh
	 k0cJpfuOSE+gjYWzAdwp9P9o/GPZGGlebMjm8CLlwbUMj62JY09k8kYtqyk2exH2kZoeF
	 UY5yXwe4r7wf4gSM7jHWyzcyR4FkDACsxxrOz3Gu5yoYYuGeY3NOYuww/O4BccooPHaIu
	 vPxNCZ+TFEGkPJ2cMK4HsjS87ecqTG7hBOkM8c3nhPkCG5egwuTII6KqkdatGWsEHq8wv
	 snPuyRTDpirP+fB2BiLS2HQS6qeXnjEdz0Uu0kfIcxCiguDwTE/tcm/Ru18zHZcuH8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092756;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=w51d3Ey+37TwEHPT+bpsc9olaubKgaBtRO6hacL921I=;
	b=XN4yOvbFemuGlWDDFG3QV03d/0YkCatuvW0sFA/Y70I8ipSPA063BGYhyKJW/AK/rc6s
	 NC1py8hG0hiolLofyomP7xpUV3k/Yg+PAMG1hA7SOO7vDGLVf+e4XTYht5hAsh4Z10QBs
	 6FXQ3KUADb/OGDivOd5bCpYZj7/ElUBoulpqlMwOHc6Et7MwzRR9wTtZMLeNSd9G5vMyx
	 kit71jc++zYOtyiUERY45ErasQ5eSUQEsICTpFs4od7CtDGP/KJreLMm/Z9/rpV9hyO8z
	 FRxE5vd770gfymsFxwrJT+HbDTf9oth4rGfGUfcZ5j6FyZ4Cqj7ZkuDPua7TVBA1gxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=BrM4Biqs;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB51606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=BrM4Biqs
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xLdKm-00000000qUf-2K4X;
	Tue, 27 Oct 2026 10:19:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=w51d3Ey+37TwEHPT+bpsc9olaubKgaBtRO6hacL921I=; t=1793092748; x=1794302348; 
	b=BrM4BiqsTHhCc1l0H8ODESg70yST7jHEq+k7olVmBD6ZoXRQbfX5xR3D4jZxwITYDNuxKbkWqdC
	1zv79imOb8iQGd1OpAq28h0V/l8ZKDzi99/BG6sN9kowoLnmpMeBUhPyUzgL0pNkfJxjt66J7Ct1E
	SfKT4sPhC2apLAMftcGGHLXrsLUBomoYcPCSH0XdtOXbME2k65qVvmXekXJLDK4wxTotodNdBB43v
	DTMBnqgDmJjrF2R3w0/cwKeWgvrSeDswbr9w9CiMnlNTnP+kZUNA5EaFUNN9tznuBVlhb7cazCtmi
	+dzdHy4+59KiwQECWgWPjyfmTuJBZCKC+sSA==;
Date: Tue, 27 Oct 2026 10:18:52 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261027101852.39b9031a@kemnade.info>
In-Reply-To: <CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
	<f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
	<20261027002635.6b831c0b@kemnade.info>
	<CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 07:32:14 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> Hi Guenter, Andreas,
>=20
> On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:
> > This is going the wrong way. The correct solution would be to convert
> > the hwmon driver to an auxiliary driver. =20
>=20
> Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
> auxiliary driver of the regulator, which binds the I2C device directly.
>=20
But that is a cleanup action, which is at least a separate patch (maybe
replacing and exending your patch 6). So the other patches can go into
their separate trees.

> On Tue, 27 Oct 2026 00:26:35 +0100, Andreas Kemnade wrote:
> > But it introduces another race condition.
> > The temperature might be read too early.
> > 1ms delay should suffice.
> >
> > The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> > reading the temperature. If that register does not reset to zero
> > but just keeps the temperature last read, then we have no problem. =20
>=20
> Good points. For v2 I read power good (0x07) and the temperature (0x08)
> in one I2C transfer, and return -ENODATA unless power good is set, so no
> locking is needed.
>=20
=46rom the data sheet we can ensure that power good occurs guaranteed after
the first sampling, so this approach is fine for the most common
use case. It reduces the time window with readable temperature
a bit more than needed, but that should not matter.

Regards,
Andreas
