Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10854E3763
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329630; cv=none; b=dlIgyouv1AHPeInGShSu5ElxLrn29bog3SggyfbQpuTp/wJi9B0mWRDyoW/1P6osCwrbRJoGlwJurBhlyc1CmuXOoKfxd5909v+EYVe1hnlOn9+ec14pyLflRbEDCxHncDv1jlC5c4+mn7ZuT1oNNzHA6UgOhH9CKItBGL9ni0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329630; c=relaxed/simple;
	bh=eF3WiwG/OO85RPuQqYrJL54HCQRdPZWGCE5wN6kt1CU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OkS5mTXGIO4pVVfsc3mpVOZH2qsKKCws8aMdMLCnioVncegAXUYI9V7131zOWmy23p9aHoNPHLoGzP/gF4p29AfXkB3eWSKVZCt5ugN9kWaSxAShqBqmXdJQQN3Gufn2bqngTS6KCe85WL59ZALiOCKH6uz4JO4PcnouEf02NHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNWDna8E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNWDna8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03601F000E9;
	Mon,  6 Jul 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329626;
	bh=3QEnH2JQLZu02SFrmHsxRUDdDludMX6VBT8DUsJ4dms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNWDna8Eu6SkcwreHkCRnUu250t5BjPg+m+AjFMI7uPQfuPGw2QufTc0LUpZaq8g0
	 YzX0EqpKLO8Jz2ue7DPA6wESm/t+qqE4zpqiGC32A9gJ3wQRWKesBtt4PVlyk5ZmKM
	 GQbXTkdMDg15cHchoEGYs1HII5YysAkv+T5n+qkqn+81pW18fMWdh8knKhuBl1dTmi
	 ytTeHzThUTUXtQlZucNk32S27DKkDXvv9OG2OaUSY/UWjkGvw2z3KiXbXIrlCvY3DK
	 uEuacvFSfsX2X3dh+eOCDCNFQVCaicLgreCQfW/Y+o1JzUdoshM305BP5RYwjecqJP
	 mhlBE7XvoOJiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: iqs62x: reject zero-length firmware records
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260706091034.75865-1-pengpeng@iscas.ac.cn>
References: <20260706091034.75865-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:20:24 +0000
Message-Id: <20260706092026.B03601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Copying from single-byte struct member `fw_rec->data` can trigger =
a FORTIFY_SOURCE runtime panic when `len > 1`.
--

commit 6a318070f0257b9e2c17486973e153120eee9929
Author: Pengpeng <pengpeng@iscas.ac.cn>
mfd: iqs62x: reject zero-length firmware records

This commit prevents underflows when parsing IQS62x firmware by explicitly
rejecting zero-length records and securely comparing the declared tail
length against the remaining firmware bytes.

> diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
> index ee017617d1d1b..412ae7777f729 100644
> --- a/drivers/mfd/iqs62x.c
> +++ b/drivers/mfd/iqs62x.c
> @@ -237,7 +237,7 @@ static int iqs62x_firmware_parse(struct iqs62x_core *=
iqs62x,
>  		fw_rec =3D (struct iqs62x_fw_rec *)(fw->data + pos);
>  		pos +=3D sizeof(*fw_rec);
> =20
> -		if (pos + fw_rec->len - 1 > fw->size) {
> +		if (!fw_rec->len || fw_rec->len - 1 > fw->size - pos) {

[Severity: High]
This is a pre-existing issue, but since this modifies the firmware record
parsing, does using fw_rec->data as a source for memcpy() trigger a
FORTIFY_SOURCE panic when the length is greater than 1?

Looking at struct iqs62x_fw_rec, the data field is declared as a single-byte
member rather than a flexible array:

struct iqs62x_fw_rec {
	u8 type;
	u8 addr;
	u8 len;
	u8 data;
} __packed;

Later in iqs62x_firmware_parse(), when handling IQS62X_FW_REC_TYPE_DATA,
the code takes a pointer to this single byte and copies len bytes from it:

data =3D &fw_rec->data;
...
memcpy(fw_blk->data, data, len);

If the firmware payload contains a data record larger than 1 byte, will the
bounds checking mechanism see the source object size as 1 byte and trigger a
kernel panic? Should data be converted to a proper flexible array member?

>  			ret =3D -EINVAL;
>  			break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706091034.7586=
5-1-pengpeng@iscas.ac.cn?part=3D1
