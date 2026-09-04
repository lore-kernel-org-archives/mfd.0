Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518BF422556
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505122; cv=none; b=ZpAlM1BYi4iHtYTu52T5zkOBbTcSBXASfq3v/8RtONw8WffncF8Q7JFz39Y0KP4je+YvJiZqX1QICmfJmTEzJ1/4GSvfZ+mfP3Wc4KfrA7iXqk15AiRJ76vY5yySbRY94+H2FfUm96/VwoUjbkTGkI/mX+DBX9TVpwb6VX5WSzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505122; c=relaxed/simple;
	bh=LOeTtbZCa0cEZvj2Kq+kpJC3/++XvQGrxtloxZ6UrxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KtNNzP+qVuoTjJDyCjUpY5EspioDCGbepREs9rBGKvv2DcvnWcNU/P6D0F3e7T+5XpPmJ24lY/bLuNAowrBf+3eN+kJk9VWSmQDXpOc7eJzYaU8NpIW0v6ju61+PejYS3yWcTTIYADozZe7mF9sMM5AYdDg/J+2/ZlLZ5QWSPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsJRaOtF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsJRaOtF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBE41F00A3D;
	Fri,  4 Sep 2026 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505120;
	bh=HuiYKgFLMZRwSzrB7Z5AWLytqubvsIW8UBMBnq474pU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EsJRaOtFHoWDVBBsnOp1dfBgkvI5Ade0nHtrK4T0fpcBOvT0J9WCb/14XkZlmYabI
	 yjvmtNe7n6zFqknJfy1DQXwOk4xBxc9WT/38OHuOakPEJKqIbaT1EZdWaszyKLSpK/
	 rBseWVDWImswFpRTHIkcFih68Iukc6A0qmVpPZvxjrZ8qGB0/YxItNFrsSmWGMcpgf
	 i469fDSUv8Y7mDto94RQhExGAtefxvut/LYY0xoEd/ZH6HXmjNp5K9E1FVxCqGhLLS
	 cN0+8ZFJ2Ola5eEoAYsqN/dtkTunN81Wz8G0iA/1FHkokjSwSiTVhIFjcQagzFmmQP
	 09mkDATJJJ5xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] mfd: tps65217: Fix NULL pointer dereference on
 IRQ init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260904063439.69881-2-r.zhambakiev@prosoftsystems.ru>
References: <20260904063439.69881-1-r.zhambakiev@prosoftsystems.ru>
 <20260904063439.69881-2-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:58:40 +0000
Message-Id: <20260904065840.9FBE41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dynamically mutating the global non-const tps65217s mfd_cell array=
 during probe violates MFD architecture and corrupts state across devices.
--

commit 2466cdcefeecaa1a479ae1c537a7a6c523875175
Author: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

mfd: tps65217: Fix NULL pointer dereference on IRQ init failure

tps65217_probe() ignores the return value of tps65217_irq_init(), so
when the irq domain creation fails the probe still completes and the
driver ends up bound with a NULL tps->irq_domain. Check the return value
and abort the probe on failure so the error is reported and no
inconsistent state is left for removal.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index c240fac0ede76..2d04d9e0ae29c 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -333,7 +333,9 @@ static int tps65217_probe(struct i2c_client *client)
>  	}
> =20
>  	if (client->irq) {
> -		tps65217_irq_init(tps, client->irq);
> +		ret =3D tps65217_irq_init(tps, client->irq);
> +		if (ret)
> +			return ret;
>  	} else {
>  		int i;

[Severity: High]
This is a pre-existing issue, but does the code following this else branch
corrupt the state for other devices?

If a device is probed with client->irq =3D=3D 0, the else branch executes:

		/* Don't tell children about IRQ resources which won't fire */
		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
			tps65217s[i].num_resources =3D 0;

Because tps65217s is a global array defined earlier without const:

static struct mfd_cell tps65217s[] =3D {

This permanently zeroes num_resources for all instances in the module after
the first driver instantiation without an IRQ. This cross-device state
corruption leads to missing IRQ resources and non-functional driver features
for legitimately configured devices.

Should the mfd_cell array be defined as static const to adhere to MFD
architectural guidelines and prevent this state corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904063439.6988=
1-1-r.zhambakiev@prosoftsystems.ru?part=3D1
