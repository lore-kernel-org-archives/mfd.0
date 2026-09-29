Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C425228D;
	Tue, 29 Sep 2026 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691335; cv=none; b=brI6T4Xk8XsIJ40hfrBVbWp/uNkggforDq23m8v97r0Jc2bBKgVFRfcR3+zcskFPHk+WLFSF8MEyiWCDN238+bctkcocJZKIAUa5pMFVmee+azA9P4nIIW1rS7OU0j8xJlhVv3XY5SZ1wlPnw3Sc2IeKc/hbFIr/q5m7QkO4mDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691335; c=relaxed/simple;
	bh=sNp6E0l+G5Pk8sqNqlDNGbRfRa7etbATFsDjmUmpmvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j2EoheCtRLADzMLcwhljahns4Ft6E3b3Jtn4KT2G65S4hNqXn+gDpPMc2GWCbk8ZRlfpP/NVOkS+tZ9AgKbDaf7N8akgYnjkbwZtEfwjgEbzTd1DJ1tXqxgO1+yw2pwus4pwNTGq/hnWhUgcEQB3f2hkuBVoUmHTmixIm72rKus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkE2qqs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkE2qqs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358FD1F00893;
	Tue, 29 Sep 2026 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691334;
	bh=BJ7QnjmNkmYUR5MYq7UHeKmHjTO+WozkytDM+Qy0KhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JkE2qqs47Bv3dyzWpFVpT2rEqctpGWlEX1oRSuY+lEVf2eLA2M0CNFt94jiDt914e
	 MzWMLcLImKzDHLg+7IJh2pHcx6DtRjyKExKTY6xXz2xEzxuXArYvwXlBHzyHDgKCAR
	 Fv1nHvpmQQi4kQ94f649r56C16w/P+aNDl8kyi0dAhOnKZLXLGwVVM2kXCxA2uOwHG
	 zE9NBL+Kp8V3B5TW5u3mmQ0TrSpTBmAGVF/IoTvYsjYAR3t8ip7LPrGnWQfYYopykN
	 qS98niULOZfgje3jd34ny7mkd4XSIvnfNAZ69mc5iVKK11DgA6grkH3DF8LFW0FEuU
	 PP+bxzi0WmYGA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 1/3] dt-bindings: mfd: rk808: add board level
 power hold GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929140649.55-2-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
 <20260929140649.55-2-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 14:15:33 +0000
Message-Id: <20260929141534.358FD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing matching updates for RK8xx family schemas
--

commit 93b9eb84ca6a701561f53536db13d8e8300dd8da
Author: Yaozhong Li <yaozhonguwl@gmail.com>

dt-bindings: mfd: rk808: add board level power hold GPIOs

This commit adds power-hold-gpios and power-hold-delay-ms properties to
the rockchip,rk808 binding schema to describe board-level power hold lines
routed from the SoC.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> @@ -43,6 +43,24 @@ properties:
> =20
>    system-power-controller: true
> =20
> +  power-hold-gpios:
> +    minItems: 1
> +    maxItems: 2

[Severity: Medium]
Does this update need to be applied to the other RK8xx family schemas as
well?

The dt-bindings subsystem guidelines state that when a binding has multiple
YAML files for different device types in the same family, related files
must be updated together when adding shared capabilities.

Since this power hold feature is implemented globally for all RK8xx PMICs
in rk8xx-core.c during probe, won't boards using other PMICs in the family
(such as RK805 or RK818) fail schema validation if they attempt to use this
routing feature, as it is only being permitted here in the rk808 schema?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929140649.55-1=
-yaozhonguwl@gmail.com?part=3D1
