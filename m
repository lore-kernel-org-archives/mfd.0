Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E721D39D6DA;
	Mon, 21 Sep 2026 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033540; cv=none; b=nlDCuX8prN+STBqs05jbeM6VZ/IvRYtEMyYA758S1ODQNwcz3hyHiXXiJgK61zAh3BRSNfwUMMcNt9MvInmNAKgL1R1Z5oJNH6d2323CYDGqvB/9qCTwSVi0NdxvQyGoc9sKOXKu4ea6koOqw+PHPIoHe21ZjRAqtvksgHTw4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033540; c=relaxed/simple;
	bh=qV1nkZZccP3d3TATfHTERifXq2Bn7KpmS+hYtpw43T8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KoeRDZ8v2GZtZgQSdDAgH5hgUJTJDI9ASwtQhK1ttiL1t2UgRBbU0UMs3ELyQRUM0oQFZDaWoHIAFmKjpu0c/Jg+FQcEqpq3bW2E7EyCpAqMtPIzYR+E7/Pt5hX2+yGw1z00yCUFwMKizOgJMaXRjzR/FJkt02TjeVCEoJR2OZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyVA549m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyVA549m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A801F000FF;
	Mon, 21 Sep 2026 23:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033534;
	bh=qV1nkZZccP3d3TATfHTERifXq2Bn7KpmS+hYtpw43T8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iyVA549mWFfz35pNbHSPBnXzZKlEUcScd4tqa2JsyC9+azJEAsHGIrrbPemY1zK9A
	 Zik4JBnPFRzuYEy/FrIBfTkMWonSsjLfQJLunFZV16Yjny8VfGtAr99HA41CyGwBhl
	 aALbS0CGTq0OJjpko0Rn8fRbWnIRE78UNvuP0k3oNdvC0TbPaZvxScSA+BnQ9dppXp
	 E7pHOXGn78fWQO7eG/DSWNUm/+rzUIIyXqJDDlpz92lBHd2gvg+pwa7po+dRho+ID3
	 NRR4YyEosZqQZJYV5s+iKY5WYqXPh7YjHtIcB4DdTvTTylMNKeCaqb2B69ccanbwgf
	 nG5r5Q+P7SyxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ti,tps65086: Make regulators optional
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260921232639.3132083-1-robh@kernel.org>
References: <20260921232639.3132083-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:32:14 +0000
Message-Id: <20260921233214.76A801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The TPS65086 MFD driver adds the regulator child device
> unconditionally, and the regulator driver registers the regulators
> from the parent node even when there is no regulators child node
> containing init data.
>=20
> Do not require the regulators container in the binding. Existing
> ZynqMP boards that only describe the PMIC core and GPIO function are
> valid without regulator init data.
>=20
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232639.3132=
083-1-robh@kernel.org?part=3D1

