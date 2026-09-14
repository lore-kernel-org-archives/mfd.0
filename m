Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801549F11D
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 20:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417495; cv=none; b=kOGLkSv5QH5t3GsBc8EmLD8tPgLuqjT8jLkrujTRgufxKSjB4+Vz4bXKFpZXofr8LmT/TNhhZclWtg/4l19S6JF28v4x0KunQEimliGtpuChJLd0Zi14SbLqkTBMmcvZz8brDnhiz4zBWcG6HyMyTRXM5cL4/Kx+WSENpbsEmXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417495; c=relaxed/simple;
	bh=+6LGmvLBWx4Isb3tdxIFWJXOAKShFlYLHGlmsQiG1S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gSxf5pCyNesayXPzt8e42Px3Mqd2qE9BYXxwqUeeWVIw7Xbr56CIzDpkQGHLBQ6gVhYkr5NTzaHHK/mwU7v5fUxBW/jNci4KvYqHzFoUAWNaKE1pVHabMrdd4v2mvYaHa+UCZbwGnFxJywmpy2UDm4m3mM5o3PDxnb8K0kRAlbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yqwe3gqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yqwe3gqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49F01F008BF;
	Mon, 14 Sep 2026 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417490;
	bh=+6LGmvLBWx4Isb3tdxIFWJXOAKShFlYLHGlmsQiG1S4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yqwe3gqGExlTiVazixRrESqKySifVrveeZuldfIRLiL/rWqSHgqpkxr1Si/ui2iZv
	 V3Bdnhjm3bixTnVxZmcsaPgsi4J6dK8EbZVpSjqyG768kX88liqSA+jx9Yzm4HCkOi
	 4Ptiu/rneV0DC6zWjcT+n0NFYq4B/qKrQR9wyR1P2b/sPhQ7SVg89q48CM1AzN/oSn
	 9lDNHOJFFtKOz7416T2DuRpWzriWACg4+bSXz0Cnp4PmQ8UrpWN8XU8AvMCEjngBIu
	 zVbC+cs3KVYOAVbJtTCR0TJQMcfogj9acwFJ8atFUAy4pFYhhHTrIWn3UF296u9900
	 aOopndABA0YOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mfd: rz-mtu3: reuse shared_reg_update_bit() in
 start_stop_ch()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914201456.2018403-3-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-3-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:24:50 +0000
Message-Id: <20260914202450.B49F01F008BF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Commit message description is not capitalized.
--

commit 67ee74ff3faf4f3c19662b6041b12e91d577cab9
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: reuse shared_reg_update_bit() in start_stop_ch()

This commit simplifies the channel start and stop logic by reusing the
existing rz_mtu3_shared_reg_update_bit() helper instead of open-coding the
read-modify-write register sequence.

> mfd: rz-mtu3: reuse shared_reg_update_bit() in start_stop_ch()

[Severity: Low]
This isn't a bug, but the MFD subsystem formatting rules require the
description following the prefix to be capitalized. Should "reuse" be
changed to "Reuse" to match the subsystem conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914201456.2018=
403-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D2
