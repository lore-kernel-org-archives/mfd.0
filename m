Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307B220F2D;
	Thu,  6 Aug 2026 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983559; cv=none; b=CLamDGChpFlIM6Isg1yXttOuVx1IEFDZ/y4znMnjXyAA24uIiioU4YKChfx1kHHNuygfd2rUWAgnF3hTIswZAoCBkxtJtXC8IYsXe6Q7/h7WZJsLp/I2qvNNWJ7BifV4grZ47kH3wmzCiujyNSde3dAWtoAytmDj5OSY21UNudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983559; c=relaxed/simple;
	bh=SAPOiVrROJwxHAfVuKOHKASpi7c5TjL8sGbv4RQv0iY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lEzyKUQjeUDyJEzDICfGhuXkJSYxZAj5ZIGN19YkmPwq3B8Ls//mERnzPIDIUkLB0Uaif/HhtmhCTVb7W0X+3DjWcU++cS7CMNoRHMO+GKDrbNgn0tM++tl8ja3BFy4iN8LcpEZtXvaYgV3KkZfvYoHgPfCQQJ3p+RqmTXDtY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hyfs9fxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hyfs9fxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C661F00A3A;
	Thu,  6 Aug 2026 02:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983558;
	bh=8dB4ccUcHjdYeR6JgLzP9d99zRQqS5uQgDd1XOFfFuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hyfs9fxqKJAntM+oeJ49Jh9ZfKHfcmZ1kQjN0gaxtJCXZMYO8mRWx3lIa0K03pMaa
	 ND7k7pUXhg2dq6TMrFUjX7nvBMN2QeHpBVaBBNosEcNSLgwtc7qhpJUOkYHTpy5rK2
	 XZiI45ow/Yp0fLiImmRApiNQeEZNaNjXX02Zkf56UYnnzP81yy08YhO67sbaUtbxn7
	 nrTEbwnTVDSChn8P7vK/vvTa/7qJSRYGR3cEyJchnqhB/c2De46KwcTeh3we/RM8l0
	 dgnUbtQZzA56wrmbrZCgE3/RPQd9R0KZ36Tu6W1fJJVl+f4L71VPrT6qdxIEQzOvUF
	 ljcomE/MARt5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: mfd: x-powers: add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-2-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-2-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:37 +0000
Message-Id: <20260806023238.52C661F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding omits required properties for the hardware's interru=
pt controller capability.
- [Low] The commit message description is not capitalized, violating the MF=
D subsystem guidelines.
--

--- Patch [2]: [PATCH net-next v2 2/8] dt-bindings: mfd: x-powers: add AC20=
0 ---
commit 5fdfa30c4c35094fa0d906393ce55eb7a91506b0
Author: James Hilliard <james.hilliard1@gmail.com>

dt-bindings: mfd: x-powers: add AC200

This commit introduces the device tree binding for the X-Powers AC200
mixed-signal companion IC. It describes the parent device, its input clocks,
supplies, and an optional Ethernet PHY control child.

> dt-bindings: mfd: x-powers: add AC200

[Severity: Low]
This isn't a bug, but should the description after the subsystem prefix be
capitalized? The MFD subsystem conventions generally expect a capitalized
description like "Add AC200".

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/=
Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml

[ ... ]

> +  ethernet-phy-control:
> +    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - ac-ldoin-supply
> +  - ephy-vcc-supply
> +  - rtc-vcc-supply
> +  - tv-vcc-supply

[Severity: Medium]
The commit message notes that interrupt-controller properties can be added
later with the child functions that consume them. Does omitting these
properties from the required list allow incomplete device tree nodes to
silently pass schema validation?

Since the hardware has interrupt controller capabilities, should
interrupt-controller and #interrupt-cells be defined and added to the
required list now? This would prevent situations where future drivers attem=
pt
to use the interrupts and fail on device trees that passed this initial sch=
ema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D2
