Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FAD499F2A
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261545; cv=none; b=P+xtnrIgUUfnySCc+MOGISiHDKVD11CHPIDanbovwF8r1wePTc7yVdwGtLilY8VtyhV7JxgM8gU9tcrKmEaxwtFtYZs64oc7XbYy0zO4N0iHq2u4fAAcCPXWQK50Oa8dpYcMTiuCa4v9XzXP14mrHM2BQWeiVBa8Vqg8HP+4v3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261545; c=relaxed/simple;
	bh=CKDW/IhZioX83GnR1oWJWAj71L6HDfWUU7oG9fnCU0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h+jxdQ8LTszsUm+TgjRCwpFsfRdo2TdrnTKPT/mDFznxK6tifTiCQ1lyW1T9IGm2NA+5EANF7ZrpMXLc9uneS0sXI5TK2wKs6aMf8rTCv42lUrO1B+Eejz23n2jHMGZszAtbf+3YncIKNLREDsHbepYZbBi8U1cozNLcUk36yNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLk5uwrC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLk5uwrC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99911F000FF;
	Thu, 24 Sep 2026 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790261543;
	bh=CKDW/IhZioX83GnR1oWJWAj71L6HDfWUU7oG9fnCU0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLk5uwrCctzfon/FkYqFzKNwMi/E7KYdRWlgYFBBiFmqkf7SZK2nl4cc+fk1CLEWN
	 iZSMPS2QaoeCCepAxQmF9xwyny88Zx1+OIWJ1306WOPzGcK8d2fq3bHvxsOb6zzLqM
	 kKtxEiRZgFqMJuqArQsO3Xb0UVg3F74U804fcmZj/5IpdYXM5klv7T8TgHyng6PKtT
	 nE6sjzMKDG3lS5hj4jyISwHyxBREhNRJXz016EvnzS47PwjYoSTzLluje7y79nxgEg
	 NysC2xBSrAPR+hAolMTf+CT2l05FiQ629lZ4JqtAL4Jd1yFRj0tkhsCXOSyhQ+dykj
	 o3yU6YlCp0eXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: ab8500: fix child device leaks on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260924144355.1604369-1-lgs201920130244@gmail.com>
References: <20260924144355.1604369-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 14:52:22 +0000
Message-Id: <20260924145222.E99911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: commit message description is not capitalized
--

commit 15f396efb68475064a7e0f860fc680dae8173076
Author: Guangshuo Li <lgs201920130244@gmail.com>

mfd: ab8500: fix child device leaks on probe failure

This commit updates ab8500_probe() to use devm_mfd_add_devices() instead of
mfd_add_devices(). This prevents child device leaks if a later MFD
registration or sysfs group creation fails during probe.

> mfd: ab8500: fix child device leaks on probe failure

[Severity: Low]
This isn't a bug, but the MFD subsystem conventions require capitalizing the
description after the subsystem prefix. Should the subject line be updated =
to
use "Fix" instead of "fix" to match the subsystem guidelines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924144355.1604=
369-1-lgs201920130244@gmail.com?part=3D1
