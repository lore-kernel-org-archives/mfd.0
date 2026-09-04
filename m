Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33739480350
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522837; cv=none; b=Ttx63aD/F+YdrtnbbbTI3w6U5ipxDXx+r+LsoEH38tMT+j+CJRxF85jX+D00R0NTELtU1i32kticO/b6APvs2PmmRVPp182XsR3r7gsJZKsDu9c+ibAP29EGFO4PUCSdcMGhS2n3Bdy/wxxLeMpCXioxwcagcSZcrPuInmLLTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522837; c=relaxed/simple;
	bh=/1y2a8FD1E3KJVYNx0EQoNhH14ipKrwbHvi3GSxHiCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i0XMxR7DRAKx7aI6obcxZ+TBJ63hl6fzR8QyuiCtg1n8fgzRCDw1nXItqhHbOGy6jCNHe/ZAmXskQxmL5xdWKiY2WgZwObgTzfy7kSUtGMEuAH20sEOMYcfdrEirxnHyCFyH4r7eidNQcy0G68atVfQ18azzzUrlr7himk5rGtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFMUPwXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFMUPwXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BDC1F00A3E;
	Fri,  4 Sep 2026 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788522835;
	bh=/1y2a8FD1E3KJVYNx0EQoNhH14ipKrwbHvi3GSxHiCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SFMUPwXqiZy1wFpcd91GmsKhL374efyxy8qAeX/cKydD/D18M6NoDIsVfPam3/rJb
	 rGz1X1mANLqOP1Nj7Ym7mcgsLUCeWgXV/zns7+68noMz7YYAkU6Cxe/P8FWaocfZyQ
	 cGnq4AAG04w2OWnkYNLyRkhZS2u7gAo4mXz1oSHECTL0PrwBt/SwjVDumgkZc3mfWr
	 998qZ9EMcA0Wnn6LnlU7gZ9vgUhaQc1XjxXJwDrlnYyphNZWT69QOfuBxv9zeqU6RP
	 svONqRizC+xZZb0Gjwvsg2sKqVEDU/Q1V8x97QUWASGqaFc05rjUa1jj3BKAIKfg9z
	 kwKbdzTgm3fRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mfd: fix typo "convertor" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260904114917.28603-4-hemanth.selam@gmail.com>
References: <20260904114917.28603-1-hemanth.selam@gmail.com>
 <20260904114917.28603-4-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 11:53:54 +0000
Message-Id: <20260904115355.42BDC1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message prefix and capitalization violate the MFD subsys=
tem guidelines.
--

commit 9822de653028134dd1239ce2fd2798565ae60014
Author: Hemanth Selam <hemanth.selam@gmail.com>

mfd: fix typo "convertor" in comment

This commit corrects a typo ("convertor" to "converter") in a code comment
within the wm831x-auxadc driver, as reported by checkpatch.

> mfd: fix typo "convertor" in comment

[Severity: Low]
Does this commit message subject follow the MFD subsystem naming convention=
s?

According to the MFD guidelines, the prefix format should include the driver
name and capitalize the description, such as:
mfd: <Driver>: <Capitalized description>

For this patch, it might be better formatted as:
mfd: wm831x-auxadc: Fix typo "convertor" in comment

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904114917.2860=
3-1-hemanth.selam@gmail.com?part=3D3
