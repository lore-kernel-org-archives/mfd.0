Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BE2BE644;
	Thu,  6 Aug 2026 02:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983563; cv=none; b=WMVmSr7sb3eoUIsubn1SAQhCCLjJdIMytXVSNDpYY8ui77i+fl5CZIHD5bdM2bbiirYW2lO9T8/jXhPgf0umylsJ8Ew4emBkP5UkhLFjX5xopXROMyaOZRYZppdieDMw8WoPGfyBqjYPdS1suQ1w3N9JkXfC3/HdIB4+FMbV7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983563; c=relaxed/simple;
	bh=VnubYBecOm+oCB2FFWQp47u7GV5fouPw+cuOLwdHUjk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WjCsdt/gjWmzwvMVBaMM7h+D0/kj6qi53NrW73NMIMErPDN/SJVylGTpK5/KM+NGuLvhRyfAcrYvG12vDGvMddVGPWc5ehATJUC1lP2ZqQdfNbq9dstP8o5GqwOlysTwmwJRS9yCjFfTCRa6fl+xViidntSaqDBfCjNeK2AEms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0DCohdo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0DCohdo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B721F00A3A;
	Thu,  6 Aug 2026 02:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983561;
	bh=VnubYBecOm+oCB2FFWQp47u7GV5fouPw+cuOLwdHUjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S0DCohdoBZAfmhGOmvL0qz/QQgZe4RTl0mdPFX/UXbcD6Fap2+A7/aMw8/ym462qz
	 ix3f/oNOMn6wZX/sC8u/wkXGX5CVR5xYT4aowO4MRWrpy1QVw/hqwsSvgBlc49R7JP
	 ttt8S762QgzCvnPI4C+hudXJ+fljJLt7tYd3XUT7CN7nErX4KoH6qqeCGIdWVi0lS5
	 z6zSfJsYEafUbXyEK/TUTYvssvQqsFNHjH1XP68oZclbDL3FpxN3H7ca1yBY2ImLEm
	 +w9eUZCWj8SJsb6/CUIiwPvP+jrTyzvCMmXIkczcTVuus5b2KAgA7SWwTmzRvTcnZP
	 R3qrPLPeCSqSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 7/8] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-7-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-7-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:40 +0000
Message-Id: <20260806023241.67B721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AC200 and AC300 MDIO link interfaces report the same Clause 22
> identifier and use a compatible link-side paged register layout, but need
> different package control interfaces before that identifier can be read.
>=20
> Describe the forced-ID PHY and require exactly one reference to an
> enabled AC200 or AC300 control device. The PHY node's reg value is
> programmed through the AC200 control interface. For AC300, it must match
> the address selected by the package straps and is therefore limited to 0
> through 7.
>=20
> Allow a system to provide its optional two-bit SID configuration field.
> Bit 0 identifies the AC200 or AC300 package and must agree with the
> described control device. Bit 1 selects the AC300 low-calibration tuning
> sequence. Omitting the field skips package validation and selects the
> normal calibration sequence.
>=20
> Also describe the optional xMII receive-clock inversion needed by some
> integrations. Requiring an X-Powers control reference distinguishes these
> integrations from the Rockchip RK630 PHY, which reports the same
> identifier.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D7

