Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0030D405;
	Sun, 30 Aug 2026 22:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130300; cv=none; b=Hgp3pAd1/FbhCEkIhaZVPnqtca0nFOROxKCXKEcU05k/pO7wFL7xlYQ8oAPM9bDMvH5dgjfSPy21wLPGDua5qvF73RsCTa/PT2GnhkrKC1C1/+Yuzy5goOgmJyATXj+XXUnrhrZ2xtUdMYrNW5xLhGlRip9ShkjsS9ZyhHwTVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130300; c=relaxed/simple;
	bh=8DozFDJLK0cro0ym9CXI7ufW352oLcx1O1vnZY1/Qm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KyJBbKazhgF0SrlWSQU/0Do5+PB3QXWma6KFkWrX/ctdlgESNsncJXWSueK3tnRL29ERwXc6BKOVFrgbPOtDRQ09mKoiaMxMf2txW+VSqUjmDuUnE5KCmxk6hyzaoSyVcYNLd2DLjK5wRs/YVqj8OXF+BhXequABBaRxX0tH85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTuvJMgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTuvJMgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31EB1F000E9;
	Sun, 30 Aug 2026 22:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130299;
	bh=8DozFDJLK0cro0ym9CXI7ufW352oLcx1O1vnZY1/Qm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OTuvJMgiW38gA/arH5DyfgwkorkmzEQ741sO+sZNlGkRTk92d7ozm4U9jZDlRI/SN
	 9J+KMoSm7WCCfAIgthVJMcVFjKFqZcuha1KnpIDsSkZz5bFvIL1UUSBfZ4LhG/gO9a
	 4/jsp1CATCg1CY2Dez4Ntar52d6egGM/fTw7qrv5uV0fI93SPJ+hmeIbon7+9o7Oy5
	 0mzquzwI3nplyCxn5+U0TWDjrVO4eK6vxKiJDyrev6oRnnCuQszMLy+aBunblC/WGf
	 NgiVebCQNC9TwsZdNuDfFO/uxzXban1ai58SiMkitnU1A9vLIgQ+/PCXFVYa7b6VOT
	 SXmHi2k/q9Sxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/13] regulator: ab8500: Test dedicated enable bits
 only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-5-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-5-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:51:38 +0000
Message-Id: <20260830225138.A31EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Some regulator control registers have independent enable and low-power
> bits. is_enabled() currently tests their combined update mask, so an
> off regulator with its low-power bit set is incorrectly reported as
> enabled.
>=20
> Add an optional enable mask and use it for VINTCORE, AB8500 TVOUT,
> AB8505 ADC, and AB8505 VAUX5/6. Regulators whose two-bit field encodes
> the complete operating state continue to test the full update mask.
>=20
> References: AB8500 User Manual, UM0836 Rev 3, p. 214;
> AB8505 User Manual, DM00046744 Rev 3, pp. 171-172 and 223
>=20
> Fixes: 65e03ed2d0cd ("regulators: Fixed errors in ab8500 register mapping=
")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D5

