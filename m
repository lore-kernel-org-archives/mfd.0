Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE93876CD;
	Sat, 26 Sep 2026 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447121; cv=none; b=VdRR4EPjB+utXwtdGm6W1k8HSV9KknWUHiWForvUZkeZQ4sd/pmWwOCZKluaW1MftYpB8pUw4WBD+N+GnzL3RvVtk01bUmCZTSV/AtyHfQyInPjFnbEhDb1UVQ3UH23gWr4kzHwND98yrp+76KjwgcB8h/WRl0fXRo4GodK0icU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447121; c=relaxed/simple;
	bh=0zz1qFrK3EHgv+WMaAgvY3SPlTN0wJZr+Bh5deL1uhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kfHW9QzVFriyUx5zqSqzAF1lKNBo/goqHwJV6RTTFdZuo6uc4rIbBy3Ri5l9mda4HifY0rkBwlwsFUaHokROIHEEs7zsDmJgnScgJGlcmttKT7/4npo/U4nDB5NEZhxh468wEXY0FH9OgEKIRUU8k0R/CXu/XlwqwFSG7iGy8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcZYpvcj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcZYpvcj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0D01F000FF;
	Sat, 26 Sep 2026 18:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447120;
	bh=0zz1qFrK3EHgv+WMaAgvY3SPlTN0wJZr+Bh5deL1uhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XcZYpvcjuDu6wYtNMQeu63M7GoADsWDKs6XmG7vKe6cgMPWX7IeQXIlcebsFRvLCd
	 QUS6X30bjK9ti4VJ6QCUGRfKImNT7sWGGXabl/gkyx7wnUgnF7a+AfWuYyZ85iF6d3
	 V4kkjNUKXWMUf2xB/hWWTkixhHQ1wFlJ6S5ljaYSvQ2dPOsu+S2dE25SEzcL25HP15
	 S6M5emr4z5qS1dh+j07aPNkrXdPHlx7QBcuoD27emZFmi0j5G2bIago6JU1oCNAJV6
	 v9ztZa9XQ6VeWWwLFGTgi5+AN+EZL2LdOiRo8XyUiHCueuRblL7JYxqBXf4EAsZuk5
	 qvZGzSeLxlQgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 2/9] dt-bindings: net: Document support for
 AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260925182435.21207-3-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:19 +0000
Message-Id: <20260926182519.EF0D01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for AN8855 Switch Internal PHY.
>=20
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
>=20
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the NVMEM cell properties.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D2

