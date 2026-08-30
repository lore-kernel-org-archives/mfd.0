Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE230D405;
	Sun, 30 Aug 2026 22:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130336; cv=none; b=SQRBBxWVBh6ZVNqPN1P01tQCeRXSnk5Xo7KNMHgczPjua1nwHov2W3r/LHMxu/RpIwpnzV8L0p3JL5S6i9aSxwd4iJtbhtnzbAjlsXJ3jXMaMsFrWPS+1OVJn46wXDLNvEiDv2A2fPB5N8XT9+kSFBkZde2i5espjT0Cq9P0ktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130336; c=relaxed/simple;
	bh=ixWT7QxTGbSkkdoBN6KUhCwg+/03rBobLS70lh6ipmE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e7LsIcgXJInYbG5DjgdXzMH2aizOtoPU/D1s+d1D/00fVZLn9CfmAcaDBLyDYLzoHvF5TsOst+RfgrEXWVXbI8Cz7gqcVcgPPs4cizUp76HWijNq7gYfVq+cw7zeqNMGy9U/oBBmJKQVoGE/3397A31M73hJ5o93/Hz36q2Upcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XV3Jj8Sc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XV3Jj8Sc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6C71F000E9;
	Sun, 30 Aug 2026 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130335;
	bh=ixWT7QxTGbSkkdoBN6KUhCwg+/03rBobLS70lh6ipmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XV3Jj8Scv+OeOc7cWzAqaols7+cN+OcSzQ68sA2zBBTNZ7DxRoZG3O2lBrabO+FSs
	 hhXaEy+oN5mphRGJiwIvdqZFz13Lch6uwrUIf7EXVtzYe46ko4rpBg0Q6ESnWHCio7
	 P7Q3focTQyaZLel/bSguBlsPf6Mr4go5d/Iat0XSN+I6NfMWiZ25sipcmITtzuiJn5
	 w2JvOmYPSOS8mTdJeodC16RlmzUZZm+uOG6fVquPoXAtZ483BE1uJi9+djpj64hLOn
	 AA3yjnD6C++aDcS+c+lGJRAfX74BFGC2P1xr5+ldE7MN3zc4RejfedwK9bEBauj5nX
	 IlR6FlXZeyuMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/13] regulator: ab8500: Use linear ranges for LDO
 voltages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-7-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-7-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:52:15 +0000
Message-Id: <20260830225215.5E6C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> VINTCORE uses consecutive selectors with uniform 25 mV steps, with
> AB8505 duplicating the highest voltage at selector 7. AB8505 VAUDIO
> likewise has uniform 100 mV steps followed by a duplicate selector for
> its highest voltage.
>=20
> Describe these selector encodings with linear ranges and the matching
> regulator helpers instead of enumerated voltage tables. Keep tables for
> the irregular and non-monotonic VAUX and VANA selectors.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D7

