Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2204499A4
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276834; cv=none; b=uZ5pMSTgWg2Nei0kDcayqMUtIKQ1fLm3F9kEpSiQP39IwOSmLEci65aWIIcocQdSAkfal4z2WaxSl19OfmsDQ+qmmfwjEOCGer06C5SRW9D0U5pkoeI5SYOC45UA9vXpQ8ePItLuep1MLDKM/XD1i4dzvZNkP7Lx+u5xla0rHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276834; c=relaxed/simple;
	bh=zYkIlveFCBvHF558FzDyQLcDO1+zd6+rrBKfQkdYi5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=giTlKCs58ytLLbvvvu3cBu5mf1S43T/IYP9I7Wg4eHopR9dWCMuggo5sVteNLpO4ETKJpfD1d5TD8w6XXFJRJCFKzSyEYsN0ljuz/GlVrqX0ezDQPsb73kGxU3Q88JUuQwMOGpoBGFPLRqe5RI8dfjd4wc/7zJwFyk/tv9MJPzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/75NDwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/75NDwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077E41F000FF;
	Thu, 24 Sep 2026 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790276833;
	bh=zYkIlveFCBvHF558FzDyQLcDO1+zd6+rrBKfQkdYi5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/75NDwDNisvRfso0U5zO4eB8gUBwwRJ1JiSoPL43XarG5uTZnwLJdaROWgdG2SYg
	 kqg/tO9f5hn7+SFWL3O1IqUTLIOmbEwY4TMyZ/XLR99NknRLJt/G/fuQ3OB/OflZQb
	 NrIPmzzzbfkfEwmeXYj03RBGXMQUKyssTzShQmy0aE/GskeM1O2j/YVqdZMGjJx3nn
	 B3T8IZcVpzDY+xK9WYV2IpDWwC3V18QV2ehKx+NcFxAncbc2IuTu7fY4CU5C4cS58k
	 ZukzIqrTnUUGM+OuysX1lok50je2Lb8cj5kctHjMkiawv/Rza5i1GVWIfFCcZgaxwJ
	 bZkXMoKYvt5Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] mfd: twl-core: allocate modules with twl_private
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260924185639.30913-1-rosenp@gmail.com>
References: <20260924185639.30913-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 19:07:12 +0000
Message-Id: <20260924190713.077E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: commit message description is not capitalized
--

commit 6123542ed724a298f0d89ecd6ec1bd20bb22be6c
Author: Rosen Penev <rosenp@gmail.com>

mfd: twl-core: allocate modules with twl_private

This commit updates the twl-core driver to use a flexible array member
for the twl_client array within struct twl_private. This eliminates a
separate devm_kcalloc() allocation and keeps the module data tied to the
main private structure.

> mfd: twl-core: allocate modules with twl_private

[Severity: Low]
This isn't a bug, but does this violate the MFD subsystem commit message
conventions? The guidelines require always capitalizing the description
after the subsystem prefix for MFD commits (e.g., "mfd: twl-core: Allocate
modules...").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924185639.3091=
3-1-rosenp@gmail.com?part=3D1
