Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D21531E8;
	Mon, 10 Aug 2026 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345512; cv=none; b=M4Fki/T/CVRPE8i/ROdhbZBzwC1S5zuk4/zj4fBGunpB7n5C96V7MVrOYpZmYioFIhfPKr0QwOSdZet1wXtrArkOKpcztjsQkTWi2EDQ+9bMlWxPXGT6WvfIWxgVV8rMxsVbxLBDsknadAvDQ6sEpkS1aJ1CwIkRvH6o839hYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345512; c=relaxed/simple;
	bh=9eSJpSpUXzZqqmw5n7BNROjSVyvntoETmebtXIOhlS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W/5NNT1EJm5QPluYTVP5Jerbi2dyRw1IJcE6rh38S71KWHnyHD/tpHaTan5/j2VlzdWtPh1g4oVrXN/DYAjbLVpc9f4Q6JYT2moBnAfKf63qLp0VP6aijPwwCwQxd8UeQ3FcvQbwipKIFLRAL+3RGSD5tfLaILAQQbKEDemLgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UR27ukmz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR27ukmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AAC1F000E9;
	Mon, 10 Aug 2026 07:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345511;
	bh=9eSJpSpUXzZqqmw5n7BNROjSVyvntoETmebtXIOhlS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UR27ukmzzu7hReOoZ9/ap/TFvhEh4DszExI+xwfSXY4wZcv8X9rlFXau7q4aN5GV1
	 S9lhFLaEbMaVWTR1/n9oWnH2LVo1j0E7w5hsLth/lPypC03c1d4mrTr46/SHZmjwnN
	 AEvFy22dCgULup/wA7hcjLO+9IbYus9meRhbqRS3xTG22XtVoszU8N8SNhvZLCur0j
	 oJXktlBLunLBtb3mCo9ctkRQLi/2cnaQE/XMzjguwgo2Da4unALW9N4rY2t4oe6XQC
	 RBUEUNuAEtplezKlhTdyLIzPmvklqsPRXzDQnh05VKcAUiVkBrB5MLHUIFDWPpRyQz
	 SrtiLCg1WXQkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260810-zx29clk-v10-3-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-3-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:05:10 +0000
Message-Id: <20260810070510.B4AAC1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D3

