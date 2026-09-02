Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A267049CF39;
	Wed,  2 Sep 2026 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354835; cv=none; b=ZI4ocabBW1sNV68/0kHkmqSluC/zmfbBRofLPOnnuDczhRWBxKiyrPxf0YpBAWIrCIj1otq0sD5CVGDH7fSy3DxT1YwEvMiqNcrw+nii7zk68b3AKHqnqnqlh7R8kK/ravwnRY6j94m2Y8BxYaQPn2ME/AHCi0UbwrK9iGp0F3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354835; c=relaxed/simple;
	bh=uuhR4rCRRh1/YU6F1GDxAhFo130zKI80x0wn37Qgem8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ptAXXo4CTcQPERsCUGcb+Vh1C16gBJalhRNnMRWiGdE8g/OZXKctz2WO4gyfITe8r9C2tw6MEJCA6NY8MfByi3igDf8UtJfcKmaZcbrvOJ5cQuQk0r96rxWWhEqn+JaBUZSbfeyFSABTijwspK3myMzVe3m0hFKRvSZAjWxOgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaFfFGM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaFfFGM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197C61F000E9;
	Wed,  2 Sep 2026 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354834;
	bh=uuhR4rCRRh1/YU6F1GDxAhFo130zKI80x0wn37Qgem8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FaFfFGM/d+HI7JA3MNo5kNWLQGcgAe1bM1ko+oucfr4Rl/prXcImP+ugL9gRueZf+
	 sBcRKSstSYwVhk+AHOWR8FenCiiHOBHToHIY6CRMvklOzoFiwlSjdCNSLpOpWTzLnE
	 vxa831UVAFyuIXyAsjE8xrVEb2IBoP1bOgncJ1qtUyhv+yWqQwQUqLLleNlLM/aeuU
	 tDTjXzGGzx7TAXcBTRliZAAUS6l+e2thbqH/e1Q6dDHj2E2fRuCfJxklh5RaV0ILCo
	 GJD7xqdViaGxaEaoBKZdb2vFngKUEnQ+R4cMkAYt883peK5ASKDuzcPKVvbnWOqVzy
	 Ih8fKBNnUSk7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-4-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-4-5f1610d83bf0@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:13:53 +0000
Message-Id: <20260902131354.197C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Read the fan register and level table from platform_data (fan_reg,
> levels[] and nlevels) instead of hardcoding a single register and
> level count, as new MCUs need different values. MAX_LEVEL is kept
> and bumped from 3 to 5 to make the speed change more gradual with
> the newer MCUs.
>=20
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
>=20
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> The regulator is released via a devm_add_action_or_reset()
> callback.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-add-mcu-fa=
n-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr?part=3D4

