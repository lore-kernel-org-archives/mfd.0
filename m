Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798382;
	b=CYo09ZGe2M0TKSTjA9tfp53ILSA+rQ+SEyVnSSZOFu39iY5Vdxuji4PYQGmwePp34cMJ
	 BUcWXp+jlcJVKee+SG1CYbWaeW7c62v50dxlIsRcoBP5p/4lK73Aby6dOAiNyHQIBTah7
	 n5iO5R0AxJp9i2rDNGg1b2yNXsF1eyQpdMbNHiwvrddN5H1m2tkiWOu4uXm33RgpHj2kw
	 qubQZ09YK0KYLbkvUCov+cV/uc9eCRzBH9SVfRouNQUcKYzU34uKnvF+cnuCxk1v4NOcL
	 fsIoLUiQP25P/oMyA6BQEgp//mulsc2azEn9kCEju2emXFjoY4qbUyMJW2hDZyPRzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wtnVn0RyCT6+a1VAbRqKsLm6HkUE1TOZcMZ7bvuhggU=;
	b=qrpNokUuPMUKp6rZ4QAI/myCHH3Mrnt+CrJ8D/KyQHf+gc35zX4+fI8j7sX8YqjCufEm
	 uuE+nKr60SS8zDDhbkkhkrxY9KwO1N5MHh846IacnnGWjIqxTOw/fmL8IdeGmEafhWX99
	 uYBVzaXnrCbcne1bhRf9QnFNIe50/AAhykYhud1U+anAVDPTW23TJ+5tLnoMTZNoYe23V
	 rNm7ez24QJOgcgsEfV1B5dvYgNkb/CMRxbBLfvwbkvIggqMnd3RNQ1cz5otjkEdQm8I8E
	 wFye5uUpKNqgipZNUiaiIOX+P3laCuw7N0B0IWX5Hj8y9aB7e/B+WfHgET4PLPBjDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElSKnnwG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC7A606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ElSKnnwG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A517F1F00897;
	Fri, 27 Nov 2026 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798381;
	bh=wtnVn0RyCT6+a1VAbRqKsLm6HkUE1TOZcMZ7bvuhggU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ElSKnnwGQhJND/wafA1zNbnmMDQNFxziDe6rYMOlpbCMbO2d1/ZO78dNbqj9k3q5e
	 r4SiIIv1hM0vrxioEf/GoA7h0BSXHskoIJu20MB6/diOY8tSNncYmHp38D1V7XluST
	 F83pajvhkM4myzp+Vgwi7/r5OSZpy1/OHkWoiLZy60hZ/zBv8L/DoTB5AbG+bqcPqw
	 oouHw90nScvSAA0E1p/WIZ2/uUD554qRqZl6SPXfin9wbUVbj0+WQ0WAo1VmQBZsgv
	 6SgdWzSMamUPd6zZ0i53Q+AsDTkUIptF912QJd2gERSlM/RAYPnYVnC8vse9T/S41X
	 IjNCMoIH0yRDg==
Message-ID: <sashiko-outbox-237938@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/6] mfd: max8907: Remove platform_data based probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127164044.285910-2-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
 <20261127164044.285910-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:53:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] regulator: max8907: null pointer dereference in
  max8907_regulator_probe() [1]
--

commit 7e0914d1aef4d600071fd9eab1f727f16437c245
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Remove platform_data based probing

This commit removes legacy struct max8907_platform_data handling from the
max8907 MFD core and regulator drivers, leaving only devicetree-based
probing.

> diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/ma=
x8907-regulator.c
> index a9f014eae4d61..306d662a5e4ac 100644
> --- a/drivers/regulator/max8907-regulator.c
> +++ b/drivers/regulator/max8907-regulator.c
[ ... ]
> @@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_d=
evice *pdev)
>  		struct regulator_dev *rdev;
> =20
>  		config.dev =3D pdev->dev.parent;
> -		if (pdata)
> -			idata =3D pdata->init_data[i];
> -		else
> -			idata =3D match_init_data(i);
> +
> +		idata =3D match_init_data(i);
> +
>  		config.init_data =3D idata;
>  		config.driver_data =3D pmic;
>  		config.regmap =3D max8907->regmap_gen;

[Severity: High]
This problem wasn't introduced by this patch, but can idata be dereferenced
when NULL [1] a few lines below?

drivers/regulator/max8907-regulator.c:max8907_regulator_probe() {
	...
		switch (pmic->desc[i].id) {
		case MAX8907_MBATT:
			if (idata && idata->constraints.name)
				mbatt_rail_name =3D idata->constraints.name;
			else
				mbatt_rail_name =3D pmic->desc[i].name;
			break;
		case MAX8907_BBAT:
		case MAX8907_SDBY:
		case MAX8907_VRTC:
			idata->supply_regulator =3D mbatt_rail_name;
			break;
		}
	...
}

If the devicetree omits the node for bbat, sdby, or vrtc, match_init_data(i)
returns NULL and writing idata->supply_regulator triggers a NULL pointer
dereference during probe.

[1] https://sashiko.dev/#/bug/linux-372cd4b4-65df-47bd-8b31-5a7b416b2f91

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127164044.2859=
10-1-clamor95@gmail.com?part=3D1
