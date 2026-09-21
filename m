Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA73647F3B8
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987579; cv=none; b=DtIHHX5ESlRrxwk3bCNr4YcExL6ObZFP8Ku2aU8jjNebQZTS1QPzzLdxbNQb1N3eqGLUj+18HPyHOUwbouxLwV4X94uhIzoCyxAlTpBDWGHGjYhjRkSJgcYpNWzHKfpmF3VQOYKTTGBYPBVlW33Xq5iqnQ2JGYYqNxSSrOUH/VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987579; c=relaxed/simple;
	bh=RcsnUM7zwQjOi8u6IopS6Numq/8lkQkMPuuRQHwn65Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FRTXoPyQ7rd44bclz2DNbBMsmT4R6GCrm+vxebCxssMxwQYRE2m+6VSpVKZ9cWaodsq5BZy3ds6jdrlZo6y5B58zuQSHZQ4gEhDhp7Wvoi3vKrnlO27+CETNlp9eAlJdEf+FOmPngOxWYLc8ilBad0YdRyvEIS8OZY+1S/G6AP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY2kg/32; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lY2kg/32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407F81F000FF;
	Mon, 21 Sep 2026 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789987578;
	bh=RcsnUM7zwQjOi8u6IopS6Numq/8lkQkMPuuRQHwn65Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lY2kg/32V4x3xW1StCAUPhTR9kWn9ycA5xCGC9OZrPoZupksF2MGomR55lnfEyr7A
	 cczjFSWxbZaK3G2jC6uXI8kAJ4bcj+7DgD99aiU0D2xNKyE5dinLfjgKWwGka7jJTl
	 hMS8fWve2Ffot3VA4eT8L0Ng7yPVmX9IKK9DQnRp2vlaKODtgBVcsVF1ZvNTn/TUh0
	 /kdoHKz8axxOq6TFVmi/ol/2e6DNtgdMKkI18GXYv9Q8i4IoWQgShd+cWIPehhbwDU
	 RjJCjoTFtAT+YOfd8HQKaThOaoQjwC1DC0aCh6HRWd6f5ktyyAcqBIjzaA/KTqWBdT
	 o/mUt3Gk4RwJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260921104058.353748-1-lgs201920130244@gmail.com>
References: <20260921104058.353748-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:46:17 +0000
Message-Id: <20260921104618.407F81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: commit message description is not capitalized
--

commit 9f8ab8284b10537c2859afae28238c1cd4a95c7c
Author: Guangshuo Li <lgs201920130244@gmail.com>

mfd: intel-lpss: fix iDMA device leak on probe failure

This commit fixes a resource leak in the intel-lpss driver's probe
error path. It ensures that successfully registered MFD children, such
as the iDMA device, are properly removed if the subsequent main
controller cell registration fails.

> mfd: intel-lpss: fix iDMA device leak on probe failure

[Severity: Low]
This isn't a bug, but does the commit message description need to be
capitalized to match the MFD subsystem conventions? The subsystem
guidelines explicitly require capitalizing the description after the
subsystem prefix (e.g., "mfd: intel-lpss: Fix iDMA device...").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921104058.3537=
48-1-lgs201920130244@gmail.com?part=3D1
