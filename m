Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50063F9F5B
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145844; cv=none; b=ou3+bTQXBtjh/hu6kwOzfa47k9q1ISJe9JbawL/LCvKiMmRZNf2nT+PkgYaYXgIl6plIEpWUqSOlrpcUGpfFeo+Ql+D7k21lj6ge88P5YeitixJgnydReNh3Ulug4ByOmd6fye6p5aB9fXy/N1PMuWifnuC8r1n0816vjVPV8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145844; c=relaxed/simple;
	bh=OrkVSY9WjqHzbF1mppW1Lw+ntRVNJ1tLiIm1DWOPzt0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FhCHxtztyldXs4ZLLA/j9b9yl+fMnuJbSEPiSbUDrNxkIiC2vH1ujwd9vR2Tad9YulrhsLEONdjNJRPXVRVqXFi7b6wmiHCpdFSPSWudYDc5jpRdiGixK6mVXpBRimSi4/yzw2ahL+3UTURxYqeZobQ6nkfdCPVne9HdGhGHmdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwM6hxb1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwM6hxb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEA81F000C5;
	Fri, 16 Oct 2026 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145843;
	bh=OrkVSY9WjqHzbF1mppW1Lw+ntRVNJ1tLiIm1DWOPzt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwM6hxb1u8izcre1K15Q/1NnfbPP0hNB4HGIyoYxDL+8AJTTiMM89yrv2Bs19wKZs
	 DFDRY3NTUsIdJHLjMipmotb1gHgqpuHtSuHk4S8e0JXxONvz8W+FuDT9WhK7Y3PuX6
	 Pe3BGndSIxnm7c1BjKUWXEvwpWg7SJd+rAiDJu99VZm80WLycuWwgcxpTK2VURODXM
	 FPMHu9McjUoxrqILe8GLQ53j3R6pF3qY28d+txv+S2pI0m2SbfvhRuPWe+4v5qd5hD
	 K/dcCUSV1zxV0DujaxvJtKsK8TnLcUnvSfuBKtA785I1+0OFL38wgI5JGf/nm5wlMN
	 XRe9pW71lfF8g==
Message-ID: <sashiko-outbox-174142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: tps65010: queue I/O work on freezable
 workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261016100503.2581955-3-yaojiale02@163.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
 <20261016100503.2581955-3-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:17:23 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The TPS65010 event worker performs SMBus transfers and can reschedule
> itself to poll the charging state. The power-efficient system workqueue
> is not freezable, so pending work can access an I2C adapter after it has
> been suspended.
>=20
> Use the freezable power-efficient workqueue for every scheduling path.
> This preserves the power-efficient behavior while freezing I/O across
> system suspend.
>=20
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100503.2581=
955-1-yaojiale02@163.com?part=3D2

