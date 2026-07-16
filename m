Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66C3B19D5;
	Thu, 16 Jul 2026 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222681; cv=none; b=JTDY7Qr/FdehaUQOw8HdmezxHcGH8/bJGr/eapODJ2P+kPx/DYpZu+7shdWw/8a/4akJm+ay0OXr4MEsWxCwtEVulfa2MxpJjoKDURog7wmnAkMR9aHEu7SxQLEm0kPzpZ8LXh/F9XMDvSE9/T1iuuHngRWDUcWJGpVQv/Ym+CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222681; c=relaxed/simple;
	bh=QqO6i6qpLcuGNmTL3wfhDBPGgLsTIL8qRIJs2Yj5jSo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U9oO1GaGjvW7G4Y3cdx1U9Sdp2Lq3Q+r5qlqJDQ15TKSEXQ6wtIfWj/AbrxAVHLIiJQH0pc1b5pi8yfwxuvO+zKWApnnTbF2vLGPGlgrQfwJuQ+6/Kwl4O+giFrkM0iEWh3s+0MFfCNfbIUnNEUY7IW45dItQtEswSdnzlMoz8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0whAcx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0whAcx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3881F000E9;
	Thu, 16 Jul 2026 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222679;
	bh=LDdsYbpntn2hI6OaKo4SYRt6izGMPNJGbrAuP/jAo4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0whAcx6DHlyRaBg1nfpfyRUKyV6JI/EOyCONX9Ch+hdg4oGZlEO3y8T/fBgeiDZe
	 JOJykhLjKB+d40FJFsnD6FAF/b5YWjgWd8Ag1BeIvGCejAJl6X1XetH5w3Tq50Zc+y
	 d98vTbkWuhx3lVt20cDeV4KrePA8jg0fuXpixD2BXgrwcsBEDdxSm5QtJF0ck8WP8G
	 I73uNmrUhiot0+vSOT2jIsSzBp1+G4QPu/TA+y0QLov7GbYEDdOhQvO/qpCrVNEAbw
	 pCz9CGwVralYVX9iqqR8XW6C+C4TI1B6NRsP1yYO1xxUs5r8/OkUrZYeP5ZqQV64+o
	 6BmsmVfbfB2mQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add MT6320
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260716171733.300885-3-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-3-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:24:38 +0000
Message-Id: <20260716172439.2C3881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Incomplete device tree binding schema for MT6320 sub-nodes.
- [Low] MFD subsystem naming convention violation in commit subject.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add MT6320 c=
ompatible string ---
commit 4f9d7290dc8c6616ef111069a6c3bd9726e97d25
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string

This commit adds the mediatek,mt6320 compatible string to the MT6397 PMIC
device tree binding.

> dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string

[Severity: Low]
This isn't a bug, but the MFD subsystem guidelines request that the
description following the subsystem prefix be capitalized. Should "add" be
changed to "Add"?

> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -34,6 +34,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - mediatek,mt6320
>            - mediatek,mt6323
>            - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT63=
32.
>            - mediatek,mt6328

[Severity: Low]
Will adding this top-level compatible string without updating the child
regulator nodes cause schema validation to fail for a complete MT6320 node?

Looking at the properties:regulators section in this file, the compatible
enum only allows mediatek,mt6323-regulator and mediatek,mt6328-regulator.
Does the MT6320 require a corresponding compatible string added to the
regulators sub-node, or a fallback to one of the existing variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716171733.3008=
85-1-akkun11.open@gmail.com?part=3D2
