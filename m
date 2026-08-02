Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FF33BBAD;
	Sun,  2 Aug 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703205; cv=none; b=oiCOfNrrRU8/ovfj7KY2EEj46VWPtLzl7NK/rv28Fec8u01WmiO6k6qtbEto2YVf4Gn7IrgVZ/kKSOQViAvSVmEktx5gwzfDrBHas1oZfOFZa17nl7ju+OWvNIIC/dy9+LQp2ROP634Sx1XOUxFtTR4N5RUIDvQnXMRZ5XEIuDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703205; c=relaxed/simple;
	bh=2K5hyEA9R9VPr/FHwaef66TY+flL91UhsjqL/M3Uyro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bsM8G7okARrogP+y9kDE5w5lgDQTQtKx0/OE2qM+B5CjX2Y1MrGuOiNYTLSM7vL09KZ/EeY59I2485WgGSozvyTMetznegZLdr5qgV1Vw3FyHb6n1miphyeFQDtxb+0jtyFHLk/cSQCVd8Ff4pC2LwLnbwMdwUnJAAQ7LMhl1Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0QMjWik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0QMjWik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216441F00A3D;
	Sun,  2 Aug 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785703203;
	bh=2K5hyEA9R9VPr/FHwaef66TY+flL91UhsjqL/M3Uyro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0QMjWikTHkFW8KPcMyAHz84YO8/ljLXguLZNBwtUUBlTcRFrsG0oNcYNE6VMfAs3
	 103sOygWSJ35Z/i2d/L2EFwmhBGLvYLGO5Ge7v2Jak004Gt4Nx9E+DRubIGd0D+qXd
	 e3ZJJa32Jbwlbck57HajOO4TvwEu0KhrHMCEJe9C3PwKzPOuaSGM3KkTWJL7zjcOh5
	 3HGKitOJRsq2eSbuXmYmt3MnYJGuVPltAMBAAQt+Kmx0Qe/qHVJ6AEHrxfvFXiSVdG
	 1tPbehh0VJhfi5hCyOxesl+6nTWyFgSZlsDJcOOjCZb4kdK3iLQdR9MXr7y8uf1eUY
	 cS6rf2UALM/mQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, lee@kernel.org
In-Reply-To: <20260802-zx29clk-v9-3-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-3-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:40:02 +0000
Message-Id: <20260802204003.216441F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The clock controller of the zx297520v3 Low Speed Peripherals is
> relatively clean. One register per device with gates, muxes and resets
> and for some devices a divider. There are even bits in the matrix
> controller to control propagation of clock lines down to LSP.
>=20
> The clocks are sorted by register address and I am convinced that the
> device list is complete. There are, however, a few more registers that
> are likely extra dividers for TDM and I2S devices.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D3

