Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0E4C33F6
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576228; cv=none; b=MHYXwW9e9pwgibP8NltPojD9GYNPiGGLWJMRqpJFj6OkB04avOWvvUmsWhzDIYI8A6kLSOKHu231Fqg28D0/d9qQixFth7LGr7usZqy7xlGQNyK15RI95VQc6ErlOohs3ZocvhvKCVXVDLgIWSrYIjUXC1bvSNChU5eNRxyOZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576228; c=relaxed/simple;
	bh=6UdJTEwHRE1A0awxBxgJt4KjARWvXCycJDG4G+GPVhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jQpb0rm8TMQvu6RL+jxzBZV+2PBUcCs/OCvlLbP4KNv6Sg5SzDsM96lJgxuMEbVdslic+pAFb5e4p+mUyMcSsJGG+uyofjDxAH15KoH0tEoXzUwc9zpKWvmLJSvk6NUz/xqA/+RPlSkUo4KIozMcG5jxVI+CT6WJx+K7fxgu588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDP9WFGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDP9WFGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10551F00898;
	Wed, 16 Sep 2026 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576226;
	bh=6UdJTEwHRE1A0awxBxgJt4KjARWvXCycJDG4G+GPVhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YDP9WFGkMggU7khY0w/8tSIZ5GfpovYvSiz3NWEgUuWh5eSBdq29thustLirE8ogk
	 Gxx2Yh4UQJvpUYYeHQcNPCXux+PifJ4Hx+yXzDx5BXrv+IR/oepW/9KSUbb58UsdCc
	 uVJtPvl0f3IC6CfQrVoyVasaB3qhQz+7r5z5H5YbwF38KYRsdPNLeqs2vZItGEFljF
	 q2AD3mJJFxmbRlnvYOGdqGcpnSJYg5iiDwhCog61ILT/Zzwo+a/3126byFz0aJCG1x
	 IrwFtLL3L5LRNBOTvZwy4CLpLy1DxBJzHzGnVokN2m+mZHBrOWOlcDxwfK3YO3Bcwr
	 QnlO9pALSH6+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-intel-lpss-debugfs-v7-3-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
 <20260916-intel-lpss-debugfs-v7-3-eb51d41f55e0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:30:25 +0000
Message-Id: <20260916163025.F10551F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> There is no point to keep the variable dir just to assing
> lpss->debugfs to it later, just use lpss->debugfs directly.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v7-0-eb51d41f55e0@gmail.com?part=3D3

