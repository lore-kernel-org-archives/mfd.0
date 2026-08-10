Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4227F728;
	Mon, 10 Aug 2026 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345649; cv=none; b=OlaRAcnC7h67cohCl8G1jzggkgb4xMBR22XhWs7O6oh+rMG61MHsWrDmF/Yqs4is7lfFQpKPdF8OYZVEEUoL3b8fWS5l9+16W7jvfMRWBI7C39cwYvYA1M9tF3JxftbStVRGOZecxdxFjK0P60Q19mlG/3k3hj702Zuwjx4xeKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345649; c=relaxed/simple;
	bh=O4CLj1IyPxPFEkmDHdGidGNXJkF6gn0MCx0pEi6/arE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PhRMS9dP1fSIHHI7H1MJHCsuxJsMG4HXSpm2gxeeLi2AHpAXS38zPlFjIZT16ulXN2i31VtWD1wPqnbVpDn+fyWLuDMip15u13qgAIhl76mHRi2gFO8paBcSXeDSW0GDL3rHSBj4CK/bnrFMB0NILgHHnlyT4hT9LKWAxdLlNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOQQr8UD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOQQr8UD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFC31F000E9;
	Mon, 10 Aug 2026 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345647;
	bh=O4CLj1IyPxPFEkmDHdGidGNXJkF6gn0MCx0pEi6/arE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOQQr8UDMDJ7qBwa51S5mAdlRk6vM3UeRi3aYsEJNVMgNPn57NXC823de9ten1DUt
	 3yNk7VZQiV+qc2CmPipDjeZf4I/iNdoGpfbEKyXtnL1/4WTLvtShPoHvTs+N444fWg
	 h+3zTVaciAwJwRzwLVyZLmTB58nRj7oL0vHKqxX6ahradoe9r2dkIekMKGGMaNvzVF
	 eawW6/Fo1YY0XxDTGj4oza+A1VDEEtX4yDBPOwEwvDJGPH8OgwgXeWoIJclXRvRtcp
	 8UVrUq8GYQIoHD9hz8Bg6H6q33qCSWHHy+BduptfI8EmZ7pCXBW9OWnc9T2Px7T11O
	 ABSroe37KJrNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260810-zx29clk-v10-2-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-2-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:07:26 +0000
Message-Id: <20260810070727.5DFC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> I don't know much about the hwlocks yet other than that they exist, so
> there is no header yet adding meaning to their indices. Presumably that
> meaning doesn't exist in hardware and is de facto defined by ZTE's
> firmware blobs running on the rprocs.
>=20
> The zte-zx297520v3-crm driver will instantiate separate MFD children for
> clocks and resets, which are handled by separate clock and reset
> drivers.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D2

