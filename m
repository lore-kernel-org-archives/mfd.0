Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926F40E8E0
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549098; cv=none; b=QAlZ7ka0C4ptsnRt60LzBN5gNTu+iMmdB4QMg0LvCrfIVK/d2PradPcgp68d/kHVYZ2FCIY0UjDsYEd+vgKXArzQ9OaBq8x45A1oNp7HdR9rEqFlDnDhKBkJ/Xdc/ehviNs1vpIymOimFXSGgvP5hqlp2/T5talP7LpF3JOYsIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549098; c=relaxed/simple;
	bh=G+Onm7dS+XbEOeeEqKwNEmYa5woul5ynBr8s7YBxRWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r5I3Lr9JUECMv7UcvPJ7OihDddpu0eZIr/bstYUV4VDlkdaNIk7+i7xhrfN37qxqvtiZP1IJmucsYTtsKq4RW+NDg4n8SPt8biCCiHQs/4IOc6SQ+XSHoRBFVcniUWHpqhXf3rCCUNX2vLeHoeoPPhYBdASK15EdtyFf/WPeXc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLggg0sq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLggg0sq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137B51F00A3A;
	Mon, 20 Jul 2026 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784549097;
	bh=G+Onm7dS+XbEOeeEqKwNEmYa5woul5ynBr8s7YBxRWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLggg0sqg78OBJpjTtXhyZALvh5fW+JvFl2l/GqMpNGnAgQdS0B1HXDTxMvskzTuW
	 V/8R6pF9RHNDfmlSYKchoDs0+bjr36Mkasc5EUjGl4kcMtL0ICEIB06iR5Fg9tnuO1
	 xChRZbVMtohUOTZI69UD3aauQaQJzzOCVJi2RGCjWUvDJabNNcSdZOQcYD5Qksg7tO
	 rw0KT6Bbg38+3MdPqSlyly+04FpSnB8tbuL3lwmRRI0qqEVNaeNkaqJ6KnOyFtwDn9
	 /v48J+acbdlv6u07oqOyJoVRtO9EDvBYLJ7cfv4VnrZkvrrJ1Nb7iCT5Hzwav84SY9
	 890tx4I2zrq4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: rave-sp: validate received frame payload
 lengths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260720115523.99956-1-pengpeng@iscas.ac.cn>
References: <20260720115523.99956-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 12:04:56 +0000
Message-Id: <20260720120457.137B51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Commit message description is not capitalized.
--

--- Patch [1]: [PATCH v2] mfd: rave-sp: validate received frame payload len=
gths ---
commit 873bc20d53da960d2e1fea67e7df00d3f436e3f0
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

mfd: rave-sp: validate received frame payload lengths

This commit introduces protocol field offsets for the RAVE-SP driver to val=
idate
received frame payload lengths. It ensures the checksum extent is proven be=
fore
deriving the protocol-data length and passes only the valid data length to =
the
event and reply handlers.

Link: https://lore.kernel.org/all/20260706092337.78754-1-pengpeng@iscas.ac.=
cn/

> mfd: rave-sp: validate received frame payload lengths

[Severity: Low]
This isn't a bug, but should the description after the subsystem and driver
prefixes be capitalized? The MFD subsystem guidelines require capitalizing =
the
description in the commit message, which would make this
"mfd: rave-sp: Validate received frame payload lengths".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720115523.9995=
6-1-pengpeng@iscas.ac.cn?part=3D1
