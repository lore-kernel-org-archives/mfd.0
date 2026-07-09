Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A21399889
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616826; cv=none; b=BOXdCrDONUfyyKCEYXD9vigvxViYkz29RhHyCdTXX5LlIu6SsikuBBAlgwXkv7IpHcZSkeXJoNkxsTHpFxbkOsCBY6ewUVkrkg8R4BrlDQYTaVZkE/3syWFvE+OkBRhxmNiAsC8Rumo9SfNAhW78EeUNCC3fqSCgmCk3+n6MZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616826; c=relaxed/simple;
	bh=LB6v2KqxYtq+eG1OxsxEwqRznK+aswDmjrQzJE/c+5s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g3Hpqd/axg75Hjmi9NbXkqtDVpod/+OAsQD2qiutSgUJPeNFXnALveS3EIeSIyPrnmtpDneVTxvOPHUkf9iBU7e5XS9NPK5Hu4AeB3yyZZHXfHShVuU6tF2IVe+KfrYWiClraHFfdrQTHUAjTBh9YfUSc+/WNUqBXw9y+dVbcH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPq4et8J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPq4et8J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2A21F000E9;
	Thu,  9 Jul 2026 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616825;
	bh=eR+zH7iX7a0rnbPzVwIeFgcbVBuJfIvKMcKYe3cFNtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPq4et8JXacyr2IkWuDHxVmr2XG1UGjZYkuHP0LOtQlatqy1/6BpTPnQfTz6Xis/U
	 7xTnrhLIcAW0V3iifCBTqcA3G0Tg8XnatRmhLv06kYp2O9+hEx6jGZExcIbT4s8f4l
	 YENYaxFdwV5x5IMxfT0gu09/A/M7bXFRv1pgTRhriYgQKy/VRuWh2qbmN6/yRlghxT
	 SOvapDsil8ymDwElvB+6tfFIaL+WWrQxmkdR3+tI26D5GluZcYp0WzyTd2cDaQpz5g
	 Q3ABfFkDh8etV5BIl5GH87xR+q09d4FZ+fvLyst0vLYNRZg8H/9Q/zOjtl+16QspUw
	 TqaW/ajhYz+HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/23] mfd: kempld: Simplify device abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <03fa806b7c0fa6a68d34384f694cbe83a17fba90.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <03fa806b7c0fa6a68d34384f694cbe83a17fba90.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:07:03 +0000
Message-Id: <20260709170704.2D2A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect size argument in `platform_device_add_data()` leads to a=
 KASAN global-out-of-bounds read.
--

--- Patch [3]: [PATCH v3 03/23] mfd: kempld: Simplify device abstraction ---
commit 7e6ae4ec35d6fd67d9b5043a16f7af0d87229065
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: kempld: Simplify device abstraction

This commit simplifies the kempld driver by hardcoding generic platform data
instead of using the ACPI abstraction for multi-variant support without real
variants. It drops unused members from struct kempld_platform_data.

> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index b64729918dfd3..839328bce1506 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c

[ ... ]

> @@ -415,16 +390,10 @@ static int kempld_probe(struct platform_device *pde=
v)
>  		 * No kempld_pdev device has been registered in kempld_init,
>  		 * so we seem to be probing an ACPI platform device.
>  		 */
> -		pdata =3D device_get_match_data(dev);
> -		if (!pdata)
> -			return -ENODEV;
> -
> -		ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
> +		ret =3D platform_device_add_data(pdev, pdata, sizeof(pdata));

[Severity: High]
Does this code pass the size of the pointer instead of the size of the
struct?

Looking at kempld_probe(), pdata is a pointer to the static
kempld_platform_data_generic structure. After the changes in this patch, the
struct only contains a single int.

Since sizeof(pdata) evaluates to the pointer size (typically 8 bytes), could
this cause kmemdup() inside platform_device_add_data() to read past the end
of the structure and trigger a KASAN global-out-of-bounds read during ACPI
platform device probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D3
