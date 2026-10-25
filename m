Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904882;
	b=FxvuaRD039YEsQSLRGfO3NKCRf02JtHqraZ4M6+fF8s7ctEj07pFFVHSzsWsSzMjOYo4
	 FuNxO3+ZkQvz4rQxv1Qsm9GGx5Jldw5rjEtTso6yPnNKj7ePblQjONmrS4W3qohUAlfFh
	 A9DcPdlqdZBAujuGFpEQUuziOZokofHJUsOQHpOWqRlcgg3biSkv3VldYCCqM/dz45OtP
	 E5hl+ZS0ISKzEiOt1KpqzFeO1+FcHB18nGMZo/VZSfEa0v0dwPx6wPV2OxMSvDIWmJ8VR
	 j2YJui9w34hhchouTRUiiHD4OXxrMB6+eC35Dg304ZIc+96FtqohIrY1Z+EtYpA1H0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904882;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KAEz08W7W0ksDqkGR4iQPFFsugH32f/JMMYd9/J0Chg=;
	b=JmswbEg9PbzYHCK9aOgTm80qYQ/mlyyg/3Zm+s66OZzojcaADnq3hS9jqS7oGIDkW4dI
	 NjP+ELJnI/NmaCIHmDdmnncwle7hMqS03dl4LMy2JZeofjUJ9MT/V7xb9TrnIFjEobUpR
	 MjkoSSIMjfR8Vn5/D5p+YR4sm4os0onPv4r5z1AsQCtaIILyd8TiB/YFyHFQW9F0f/HKe
	 3vzmCLK1yLaO7Th/ETT4LOkAcwOhYG8gmg/U0qLXQvliXoWdm4PeMPhoIXRUcu60yfr3r
	 6bsOLgIGY2vNfHjt+aTxkKtm5k709YeK9fIVLF7Sg0lW94GDUw86XCxyzMS88pBaSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GI39U4v1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B3606A31A
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GI39U4v1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3FD1F01825;
	Sun, 25 Oct 2026 05:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792904882;
	bh=KAEz08W7W0ksDqkGR4iQPFFsugH32f/JMMYd9/J0Chg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GI39U4v1vZwuD29wlCVIHrSMBK+fmk+bASEdDuSZnh97LsSv3cq+qrAC8YkzJvo+C
	 b290UDf8IJlzSbdT2JZ+oPC2yctZLGkKT4TldapNMbvbFB84l5iDn788Wjw42OzeJq
	 f411VPcIDiKIodq6jxERPePvEfHV0iUnDVou2E/tY5uZVrhHM6jEDCc98IhW5+X6b1
	 ONlHIxVksZP+fuC8GzzbLYmCo30C+PUcrgA2lM/5WpAM+XpnXwzj0P3aBQbnYwpBMA
	 yt8lsHn8lu7Wqa1mfvyuKS+VBeLwvTA/oH7YG+jWhcCjloAq3LmI9bzS+OqpIx5j8q
	 arRP60MuKmsZQ==
Message-ID: <sashiko-outbox-184078@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 05:08:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Convert the PMIC DVS GPIO configuration from a legacy lookup table to
> software properties. We use the new 'dcdc_swnodes' field in 'struct
> wm831x_pdata' to pass the software node to the regulator driver.
> We keep the DVS configuration parameters (control source, startup
> state) in the platform data.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-samsung-kp=
-v4-0-e21253295e68@gmail.com?part=3D2

