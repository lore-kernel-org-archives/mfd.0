Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2D344D8C
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973402; cv=pass; b=eo+hKOkXFeVclXuM8CM23lLH8nc0jZhhcpjYUIE+vZZrV9iKiptzcqFO6GRkdC5wA0dyOEesSyxLkQRD3agdgYobRwVmAk/8x7OgMm78i/AvY+k4D+PHgDfPS1Xm1oDF8HNmExiliCMvUKrLZ0QCi7lp6K6sYDDN2bbh1pmhMhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973402; c=relaxed/simple;
	bh=QnqEdM6g6z87rJsgHHDpRTe0TDCw8eoamyR6Pa8BM/c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C7xu9hAwF0zdlbR8DH6eltzu2o7Ee9tEAmOivpRs05HZXXNgYpIBj9rd6wvoVBJH2Hzuti9u8WSjQ+85dLcvhr1tXxfKY0FYEKbdXtObNBDvWGxQkBjD6EzuqxSY7rdH6kcSnkSjMdUm3iyHC1uFNS3Wf7mrOyra/67CKU/Xb00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=N3GT3OZI; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="N3GT3OZI"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DEEED201EEF;
	Wed, 14 Oct 2026 12:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791973397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A77QV38oKNaSyzrLr+t8fNoe0o2c0y5v7727CA5MfNM=;
	b=N3GT3OZI+gNDlTOVLR63CZ7dFZQOmSgY4lCg2jMAd5Bo2aBkaYmF9y2eJxYWK6tY9WjIrf
	mKjwtaC82HmAuEBPlc3B9O2p5PDeCJXmZB4rnFs0eLNbbXLJ4aNQgWbFLDYrKWgtmp3xBf
	IAsBft5LW1LlZOTQ+cxN5wPLP8cljjT9e0cjxQkremUYRNCira6bTRYqzXtZPqVVKg+uJr
	8QVZ4Vv5cUVC8Ra4UdaRXXXXOuGpcRAFbKEW6A+yL5XczrFE7oxNdyA5xFVNIIHXhaLrsQ
	o7hMec8pF4wrx6vB9wAU/HgnI6fKhLCFc4Da3UoRafK4r6RwOHPZ4mNDagH9nw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791973397; a=rsa-sha256;
	cv=none;
	b=Cqq+j8/c7VbNhpOz2lXCZR9mZ6bVnlmFszHnKtzNxD0CX7B3es0Sjo9hOEK9h0Gu3YgttJ
	vTH9sO8EE8u00dH6R1hWxlZseC29N29bB6BrXiGxq+P8prAV1BeP2CVFX/vppLmdmeIJZN
	7nCMjq0wjZx7LXxFs/Njs9WyPSFxt6x5WKJy6FzCmPnjD6uO02kOg4Zmroav/daXXeOOzP
	P3sju0K3i4WXuWqMvcgVMSO430/59SAHT+us4VWY2FoPGi+1xQkaokQRZ6RkR2pWl4bxme
	1xpqKHs1MITpJGRkpS55zs3qZRhDPFHbYabvZxt3eAbnYnGWX1Py0A/1wSPERw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791973397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A77QV38oKNaSyzrLr+t8fNoe0o2c0y5v7727CA5MfNM=;
	b=NH8zXlbIZVbNwzo86KEoeV781Y1QtfiCSUMzhfsa7tsw86IujokWXDDX2d+UjQXyeR62er
	+0WZAEZQ1a13vBnoS10o584VQPh7DssX6x1c7VU9CP0ZzDlJrHi32J35S3Xe/4Ar1CfDbf
	/oRv0eInJC0JfLEM3p1TzpWWsl1QR9U1P46eyuvWy4N7+mew4IIKl/+pkqs6HFT3T+zzKH
	mhfL3BilAGXMErY0CwuHIsJtfOhHuk9glLyT92Ipd+hRwWED9+vjJQZuMSx/jJM3Kugqxa
	hN65Xk9d/7uMKIdIDGhvRixDLv4o9OuwgFQaiOWK+VznlHhxk3jjoisY0eBeKg==
Message-ID: <f1c24a603964302ec1462b1cea790a2a7079fb3d.camel@pengutronix.de>
Subject: Re: [PATCH RFC 3/5] dt-bindings: reset: Describe the BCMBCA PMB
 reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore	 <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Wed, 14 Oct 2026 12:23:17 +0200
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-3-daf5d177e113@kernel.org>
References: 
	<20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
	 <20261014-xg6846b-bcmbca-xrdp-reset-v1-3-daf5d177e113@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mi, 2026-10-14 at 11:48 +0200, Linus Walleij wrote:
> Describe a reset provider below the Processor Monitor Bus (PMB)
> controller, which owns the register bank and serializes accesses.
> Use one specifier cell for a SoC-specific logical reset group ID.
>=20
> Define BCM6846_RESET_XRDP for the coordinated reset of the XRDP packet
> engine and its three Runner cores. The vendor PMB device addresses
> identify individual blocks, not this group, so assign it reset ID 0.
>=20
> Define separate IDs for PCIe0 and PCIe1 soft resets and PVTMON analog
> acquisition. Describe the scope and prerequisites of each operation.
>=20
> Use only the SoC-specific compatible because the reset groups and PMB
> interfaces differ between BCMBCA SoCs. There is no common reset
> contract for a family-wide fallback compatible.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     | 46 ++++++++++++++++=
++++++
>  include/dt-bindings/reset/brcm,bcm6846-pmb.h       | 15 +++++++
>  2 files changed, 61 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-res=
et.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.ya=
ml
> new file mode 100644
> index 000000000000..c8a1e5132fa5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/brcm,bcm6846-pmb-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCMBCA Processor Monitor Bus reset controller
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: |
> +  The Processor Monitor Bus (PMB) provides access to reset registers in
> +  BCMBCA SoC blocks. Each reset specifier identifies a logical reset gro=
up,
> +  which may span several blocks that must be reset together. Blocks must
> +  be powered and all affected users quiesced before requesting a reset.
> +
> +  BCM6846_RESET_XRDP covers the XRDP packet engine and three separate Ru=
nner
> +  cores. All participating blocks are asserted before any is released.
> +  The bus interfaces remain accessible throughout the reset.
> +
> +  BCM6846_RESET_PCIE0 and BCM6846_RESET_PCIE1 pulse the PCIe PMB soft
> +  resets, including IDDQ, while preserving the lane-selection straps.
> +  These are separate from PCIe PERST and the controller-local resets.
> +
> +  BCM6846_RESET_PVTMON resets analog acquisition in the process, voltage
> +  and temperature monitor. Its clock and power configuration are retaine=
d.
> +  Users must coordinate with any firmware performing voltage monitoring.
> +
> +  This node is a child of the PMB controller in the third generation
> +  Platform Management Controller (PMC3), which owns the shared register
> +  bank and serializes access to its keyhole interface.

Why is this a separate child node instead of just #reset-cells property
on the PMB node?

regards
Philipp
