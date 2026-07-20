Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF740BCCF
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549119; cv=none; b=rMN00q39AExu/LGXo7TfBDHaMCm9QC+R0e3KWlsSt3OQcP11FKO+unjKogZjIHwDJPBG0cOCgPd9DYj7c80CA306xVT8hap2I4UxmTqdEtPRDEwaF8BRuMNaNm/txqSMotQrG2cR1xVs5rQK+3eYpP3P+fn2FzVae5inqKusXlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549119; c=relaxed/simple;
	bh=lBlCHnqNPHw+sdBQRoy0mxfEOl+Fs1CJ+TqLbAEEoso=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EM/IQ/P+ZKWnjoAFcR1ykXDp6SgX2mynVobWXOu2kGA/+1wFpfLrcbrjmLTNs1ImdhzIqWf70vaQ7130y1opeAd2sNuf3tJGYS+QGHN1oqwgXZsQvH27QjbaNuKk/jSaajZ5W1tT5DOVZOJYbRCoYvl40wAVSRz33i8GgRBqQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9HQO2OK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9HQO2OK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467DA1F000E9;
	Mon, 20 Jul 2026 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784549118;
	bh=6kB8cgXjUlvK4DFqK6tOCVa24MLFlKujaHR/AlWS8XA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9HQO2OKKrQfI8RCxarM1R2NFwJJA/Y9I59/SJMG7QeNh2z1/tAPofCPmFz/OJBb+
	 vJgaNQnjZYHJsIj6hiKtDUrb384M3XSqA8v30brg8ksqqF7bQQt+JD99xsWXOaOy5+
	 zzZOb6M2wazeSJUBZ6jyN6Qcd80313W36w+c/J5IpHLO4NnExg9sN4ro/RBnuSi4XJ
	 mmaEjxbY9Mo4PT7CjHr5fb7BHj+R/jHP9NLZfbLmbQLhHd4GWcWowwkBBQqP87Qlh2
	 BBzSUacggiqThmIc10L+igxUcWYienlz06lvZkBo/zfhk5Us3eZA9l2eC83Izz5Qbb
	 xm9ekvevZBA2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: iqs62x: reject zero-length firmware records
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260720115423.94994-1-pengpeng@iscas.ac.cn>
References: <20260720115423.94994-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 12:05:17 +0000
Message-Id: <20260720120518.467DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description prefix is not capitalized.

Pre-existing issues:
- [High] Using a scalar `u8` field as a flexible array triggers `CONFIG_FOR=
TIFY_SOURCE` panics during `memcpy` due to a strict field-spanning read che=
ck.
--

--- Patch [1]: [PATCH v2] mfd: iqs62x: reject zero-length firmware records =
---
commit 73503c1abf73dab697ccffa04ef0c4a85ba0c685
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

mfd: iqs62x: reject zero-length firmware records

This commit fixes a vulnerability in the iqs62x firmware parser where a=20
zero-length record could cause the size cursor to move backwards. The patch=
=20
adds a check to reject zero-length records and rewrites the remaining-size=
=20
check to avoid an offset addition.

Link: https://lore.kernel.org/all/20260706091034.75865-1-pengpeng@iscas.ac.=
cn/

> mfd: iqs62x: reject zero-length firmware records

[Severity: Low]
This isn't a bug, but the commit message description after the subsystem=20
prefix is not capitalized. Should it be formatted as "mfd: iqs62x: Reject=20
zero-length firmware records" to match the subsystem conventions?

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
>  			ret =3D -EINVAL;
>  			break;
>  		}

[Severity: High]
This is a pre-existing issue, but does using a scalar u8 field as a variable
length array trigger a CONFIG_FORTIFY_SOURCE panic further down in this
function?

The data field is declared as a 1-byte scalar:

struct iqs62x_fw_rec {
	u8 type;
	u8 addr;
	u8 len;
	u8 data;
} __packed;

During parsing, a pointer to this 1-byte field is taken and passed as the=20
source for memcpy:

drivers/mfd/iqs62x.c:iqs62x_firmware_parse() {
	...
	case IQS62X_FW_REC_TYPE_DATA:
		mask =3D 0;
		data =3D &fw_rec->data;
		len =3D fw_rec->len;
		break;
	...
	memcpy(fw_blk->data, data, len);
}

If the firmware contains an IQS62X_FW_REC_TYPE_DATA record with a length=20
greater than 1, will memcpy abort and trigger a kernel panic due to the=20
strict field-spanning read check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720115423.9499=
4-1-pengpeng@iscas.ac.cn?part=3D1
