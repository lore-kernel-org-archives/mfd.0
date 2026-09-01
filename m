Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37003BB675;
	Tue,  1 Sep 2026 20:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294676; cv=none; b=uncRA07Q8o8qnyDssLd3Ju2gVaq++9fy5q7oD4COZyD4YULtDO89D6OnKic4CMP96ubroyi7hT7zqGPX0sLbXJGCmYPk/Aljf+ayo+UPkslXBfQ3zmper5O7+eqASNgAkBvxsLTnbO+qVFOVELB70h1pK8sAUl4DgnWXEA72F0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294676; c=relaxed/simple;
	bh=TQiNuTZ4f1vRwJBqpwXxz9WNpXIwM86esliAGHVN/sg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AnyAgmzl9/r7EBvUfSgjaR1kiab1zHuFJcHuALosL9ED1m4mXbr64ycdKYjkMzfXVLqhsY39h0CK/u2p9A2wNNOjbkIoHrvh8f4F8B9BnQZNvZiAAFDinGndQqK7YQJ5KZwjcriyDDW+wIdiPMnL6TpjOhEwXt7wHGkxkAS/zUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxKw/sW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxKw/sW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F3E1F000E9;
	Tue,  1 Sep 2026 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294674;
	bh=TQiNuTZ4f1vRwJBqpwXxz9WNpXIwM86esliAGHVN/sg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KxKw/sW7F5O0kkTyRIkDWAyJFE7jEKwAMvv7Ut3DhqacpS9u95QIhwpDycJ8B5B1L
	 21i3x6hsMA5WDh0+cOMxcrQKTdwJGnrAeP7PLojzFgcGdtnttkmxXAkIfeT8DWkkkE
	 /ALZCx0NcvFa4z8ZsHq2StrXu/DLjQ5sxm1d4Gir8a7/iZP8eCIt8Nc7+KOp2rmBMX
	 SeQkqPmXVPy86orAAaf5zYZze8uyislhS1BhwSuU33dJsy3sAuXDLz+icR4zLfQmID
	 mQ7cJZ9oZwq68Z2pY99fEykdh2TP9Fd+XxcBooV30L58/pdHmSmg+KGrusYiMFF7/1
	 ClBr1c17aRhTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] regulator: ab8500: Add buck converter support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-9-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-9-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:31:14 +0000
Message-Id: <20260901203114.89F3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Register the SMPS1, SMPS2, SMPS3, ARM, APE and MOD buck converters on
> AB8500 and the VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM buck
> converters on AB8505 so that the new device tree nodes can supply
> consumers. Match each variant through its own device tree node names.
>=20
> AB8500 SMPS3 supplies Vsafe and AB8505 VSAFE occupies the corresponding
> control and selector registers at 0x0405 and 0x041b through 0x041d.
> AB8500 VAPE and AB8505 VSMPSC instead use 0x0402 and the 0x040e through
> 0x0410 selector registers. Keep separate AB8505 regulator descriptors
> and identifiers so these variant-specific rails are not conflated.
>=20
> Describe the hardware selector ranges and follow the selector-control
> registers when reading or changing voltage. This accounts for AB8505
> using Sel2 after reset, its additional selector registers and its
> separate 7-bit VARM range. Use the AB8500-compatible and low-range OTP
> profiles found on the supported platforms for the other rails.
>=20
> SMPS1 through SMPS3 and VSMPSA, VSMPSB and VSAFE also expose enable and
> low-power mode control. Keep the ARM, APE, MOD, VARM, VSMPSC and VSMPSM
> rails voltage-only since their on/off state is managed with the SoC.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D9

