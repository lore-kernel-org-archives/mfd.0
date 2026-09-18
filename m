Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28824B95B3;
	Fri, 18 Sep 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765666; cv=none; b=sFOYcltqsM1QQCI1uKVj+0dmnyTQyu2xQHKyvW0t6TWqggc7PIG/aEob1ByluSDFmOj9y1/vlaQifmRhE1bwVcgAu0bNQA0/2NCwfH/2ta2SLgMece6oG5utBespC8aGWvUfDhKKxxoqmmMXDDwdJZt+Mpy6Pk0b7Nj0BixmXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765666; c=relaxed/simple;
	bh=p6YqbpxDIpAMTObFBLr63PN0p1LoVg8YntrjT/DjeBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k7U2Fk7aP+w+53qPThQuarHJPGRymtFj4PpzgF59+PhMBRuM/vkeI9Iob/wSAMJXybATU16R4+1A7qyMFCrDJ5TwRP7gC+bszX7TGG9ghA0sMxRl990KtDUOZlZPJ0n0rQFoG8XgoM8F6QkmVJU9wcxvsIHZJun2etMbh1AM8lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrQc0UvS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrQc0UvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43861F000FF;
	Fri, 18 Sep 2026 21:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765665;
	bh=p6YqbpxDIpAMTObFBLr63PN0p1LoVg8YntrjT/DjeBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RrQc0UvS+6MXfOKDd8GLSNqh4EjlAkMF/Ij658ISjS5C9f4/Nbb7cyoUJ9xvQZRhH
	 ZUk8aHijBZraO/A+dAlp7NrcObAe3I3YJ/mqfVhDVwVVg8lbJ4J/S727BVTRCzfKcI
	 aJWkm5y5IuIi8zuR3irZCaZ+Li7pmBkZj8tMBHgpNt71vwNjmZAu8mvIzs1XdqthcA
	 ogfG3+HCYQswo/vYjSgCwQ5EB9+n5AnpuJQmoeYtys0HyWIrM2CQckiLthi/6TrwhO
	 DtTFB0VOdNfLVp6EFTJZ29YvI3K+hHyvd/ICOeuIzlPxNRkJuJSmVb8QRtqIgjQu6t
	 6/rPvOFrKiGAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] regulator: dt-bindings: Reference Tegra
 regulator coupling schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260919-ti-tps6586x-v3-3-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
 <20260919-ti-tps6586x-v3-3-63dd240f4684@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 21:07:44 +0000
Message-Id: <20260918210744.D43861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
> Tegra-specific regulator coupling properties. Update their dt bindings
> to reference the shared nvidia,tegra-regulators-coupling.yaml schema.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-ti-tps6586=
x-v3-0-63dd240f4684@gmail.com?part=3D3

