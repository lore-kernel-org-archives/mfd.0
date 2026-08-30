Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4924C299920;
	Sun, 30 Aug 2026 22:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130398; cv=none; b=lj8+xK+zL3y2P//ZsBOOlJ4Ln9mTvTkl7UUr8iJ7wNaPETY08+m6ASoIZFNdI5mAuzhfj8dQ8FMROrZXkoGM3WhfIf3b2vkpo36jIBtYvbgg0dai+uERniLOIIbTLskNiUhsdPMG79gWl9+kJUTQKJEU5PVDI3Q9lFas3k+sDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130398; c=relaxed/simple;
	bh=zh6pIbsNhtKk6pugmJc8qwkPuSBCdb4i8lnNVy/lW1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PeJ6cXemaGbigyPS2aOeWZd1JO43UZXyUIfh6aun4Px4zyIiPGFYy/gmDJw8UuSAWTzQwTZyp9DuflBtbtPhXyJt21yg4w6abRtg/8Rnc58wc8FUClMG0PttOmOP5ZFcdvfLBYi0xhBr/Qi0fGPnqajabu9Aa9Y2E7xm2NLQkEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msXr0Dff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msXr0Dff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6B11F000E9;
	Sun, 30 Aug 2026 22:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130396;
	bh=zh6pIbsNhtKk6pugmJc8qwkPuSBCdb4i8lnNVy/lW1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=msXr0DffNdOX3qCdOY/VEArNY39RnR1UGM6iJzKtWercITn69H7+/g1lyM7XilPgi
	 IFT91EevtE0kVsajua7QtGCeBunrFXDVs0ik3Zat3BHu7E+BHwX3H4+zt34vf6ncDv
	 9GTjGTaxNfhB9/TfvSsAjjtOq3rMBKrQzWbS5M5dbc8/5WzjcwAaRc5dLkGXHAaY6d
	 cbQTIRcdaxQx3EnBCQtQ5zrhKbqC/I0U+FPXZUzHSRqGSemTAVj9bZfa3+qUpC5gMh
	 0dQ6WH8EN0ltG1urOBhahsUEq0fTfQhzH5SxfJ7Keg70ZyddoP61B/4gQFf8GoPc2V
	 /z+qgJQZVTELQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/13] ARM: dts: ux500: Add new AB8500/AB8505 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-12-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-12-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:53:16 +0000
Message-Id: <20260830225316.7C6B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add the newly supported buck converters to the AB8500 and AB8505 device
> tree includes. Use separate, native node names for the AB8500 and AB8505
> rails, including the AB8505 VSAFE, VSMPSC and VSMPSM converters.
>=20
> Give the 1.8 V I/O buck on each variant a common functional label for
> board include files which can be combined with either PMIC.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D12

