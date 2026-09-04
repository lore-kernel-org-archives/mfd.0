Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE044AB94
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525132; cv=none; b=r1Dmv5Nmk4W7dL3TbqgaThkHiQKl7vJ8mYjwHkwIcNtyAtbEL2ikJYkCvXIo0hAQ6MmYah8zxkUMo8PxODw+JBYwSkeuh5zYiOXTEJ6IkXhnr6PuBmXX/ejc+VnIk7qu9i8ipnVqBzeTMOzZc12x5zwaWeG/i/d9RSRXWC4eMjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525132; c=relaxed/simple;
	bh=6av2N/yZr09DGirc04zJUqsO+AgRL/pUoBupWfced/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RdcPlLp7q/OSGX3DCj2h1aHrlXwqJyGHkGMHN3BWM2JgwXoqMfhxwDKgUsVsCgIq44N28fDxEwYv3HlgfnbO5nIZbPRnevgDfJ//5hGX+QEDNDNdv5Lv5Kmc3/DUMljZD2J99tYkxeOah2FaAPmi6rbA1JcxRpD2eX1FMWyefDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOR4Kx3r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOR4Kx3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94DB1F00A3D;
	Fri,  4 Sep 2026 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788525131;
	bh=6av2N/yZr09DGirc04zJUqsO+AgRL/pUoBupWfced/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eOR4Kx3rJtOPkw6FPUfIIbjsehIPJLMDp87N/hiXK+eigdGKskcqncpz509n1PFMe
	 TJXLWJaQYDfMcxWTnrLXWjNyy+Q14ZwUDkEgxZHKqyIEYDORbUehLsU84Ykzibk1lj
	 YirDV8r2DwLfM42SXYBythB8PE1eYtbk6J1js1rRLRrNlBw2iI/FDgCzA2zQ4a9C2y
	 VqbbUuHrLveuQLRMp5LqvyLKLBv5vHKo7nsqaWKQf9zn4y4VdtqYzIMwLCGh1ycmHu
	 /uKsQ+oLTqRYnsUww+35O93VZoHMMXn6iEZbNDefLiQnCpSipNrQ+wNgl3oVHloOz/
	 i10BO+1glxYlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260904122834.33723-1-hemanth.selam@gmail.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:32:10 +0000
Message-Id: <20260904123210.B94DB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description after the subsystem prefix is not ca=
pitalized.
--

commit d0e23e81a331ff789b3a0fe08e25535d249873e0
Author: Hemanth Selam <hemanth.selam@gmail.com>

mfd: fix typos in comments

This commit fixes various typos in comments across several MFD drivers and
headers, as reported by checkpatch.pl.

> mfd: fix typos in comments

[Severity: Low]
Is the description after the subsystem prefix meant to be capitalized? The =
MFD
subsystem guidelines expect the description following the prefix to start w=
ith
a capital letter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904122834.3372=
3-1-hemanth.selam@gmail.com?part=3D1
