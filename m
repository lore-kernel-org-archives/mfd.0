Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC485470E82
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859113; cv=none; b=i5J963+Ry396dxhNIE52Y2Zl72MMKCqSI5j32jstwYj85ylGJiM+GEOXHpLDvpvTD8xL9zbvBXMC2xobdkTQhl5ehnlBJ0sNNl0dxZTB9NCkKQ1kIuRgNMoFGSGedgLk0QkCU6pGLCphly9DtxG8YZp72zUgIGDACKSEu9kwjEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859113; c=relaxed/simple;
	bh=quks4r7St4MJ9LSmBO+rXuL6NqM/AkfjlmvC3yt0/wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBk3MJ5Hcvn1zEAxpoGU2RqSsOx/tlbtC8zDMuvpnkEvqSDkEuM3TGtud3rLaCfoD+GULglnD+XU+ja26xQDC4Gnvgg8/h2mCOLAOxH6kd6uQIKEb6IUJE0z5HxwjhIHfx8O7jAc6QchYv0pGWxwBeRw8mQBsCyZbCtDN63FZGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+6UVB2n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+6UVB2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0C91F000E9;
	Tue,  4 Aug 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859111;
	bh=bYpQGlhm7S4oQNdUPr0C8+hRWx9ZI9emV9UFovZBzwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m+6UVB2nfR+IbIp6la6NAyNpK+mc7yqQxEnvRasEIurFNOoay1Mk57mJkngmPOaFG
	 CvIo7iEUYdp8oK18B2gemBkjdUp/IXuQNxZ9dWnvX2mi+xq5kR7nSj8Y/PuIetrhGO
	 P+Ki9/SdJY5+/YB6p7K+ombKWKFCl/IPKeNPs8JiQCkmhzo3HQx8zSdlBnX/4S+Bq4
	 GjV4YxRecckbhzaSSBPwCY/OaDMr3JXBFbVK28J8JtvSSRnOE63uFY4HS9tHE9hH6+
	 ExlLJyhsG/pxDR3f8Z6hXHtMuTrW4E1MpYQeXTJzW3j00pygVC4D7VY6xvjNpB0heG
	 TjQfLhXd2++vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] i2c: cgbc: Add virtual storage devices on the
 virtual I2C bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-cgbc-i2c-storage-devices-support-v1-4-fed38510671c@bootlin.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-4-fed38510671c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:58:29 +0000
Message-Id: <20260804155830.DC0C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Typo in the software node label property for the BIOS EEPROM ('e=
prom' instead of 'eeprom').
--

--- Patch [4]: [PATCH 4/4] i2c: cgbc: Add virtual storage devices on the vi=
rtual I2C bus ---
commit 98b86180cbc7d34ae655eafe5dcbc85e15d4bc49
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

i2c: cgbc: Add virtual storage devices on the virtual I2C bus

This commit adds support for virtual storage devices exposed by the Board
Controller on its virtual I2C bus. It uses the generic 24c01 at24 driver
for all virtual storage devices, customizing their parameters via
software_node properties.

> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
> index c3f1c83b105a8..418de90e11bb8 100644
> --- a/drivers/i2c/busses/i2c-cgbc.c
> +++ b/drivers/i2c/busses/i2c-cgbc.c

[ ... ]

> @@ -372,6 +372,149 @@ static const struct i2c_adapter cgbc_i2c_adapter[] =
=3D {

[ ... ]

> +static const struct property_entry cgbc_bios_eeprom_props[] =3D {
> +	PROPERTY_ENTRY_U32("size", 32),
> +	PROPERTY_ENTRY_U32("pagesize", 1),
> +	PROPERTY_ENTRY_STRING("label", "cgbc-bios-eprom"),

[Severity: Medium]
Does this label contain a typo? The other devices use the spelling "eeprom",
but this one uses "eprom".=20

Since this label is exposed to userspace via sysfs (as an nvmem device),
could this naming inconsistency break udev rules or user scripts relying on
a standard "eeprom" naming scheme for these storage devices?

> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-cgbc-i2c-s=
torage-devices-support-v1-0-fed38510671c@bootlin.com?part=3D4
