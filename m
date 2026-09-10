Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2249E14A;
	Thu, 10 Sep 2026 23:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082084; cv=none; b=IeZy7zSlGuIGRfZNHqEwYFUuQ23mEx81VMo1G/IIH4UiYVxX9REBU/D2/LtrRIzzsVex4qNZALK78zNU/FwMtdiUISYYemdFnr3PPvtN4Axu3oz7THnlCidT/0WIzbHcD55ICk+z4iSo7mJERg5a4uYNmekpWOq77A27FHRVapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082084; c=relaxed/simple;
	bh=ynXcRK90bwro/7kZ1phM1TDLTeSmSfDe1jpYuYGq8rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qqH6xhJxpqkxLxySQZs/AqztqpVgaYgFMEQMgdBPCQoKucxTpfPT6fyW6frz5ZaEpuctx5WW5NmpoCnrzQCXF/amZ9+YCg6h41P/LEfR8DiZmMgvh1hB4ol0ZWLRLZ7zDNtf3PHuSHGIOsmdMIkKCnVyGixzl5u1Sap5pAgtKjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5XMMQlD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5XMMQlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64CA1F000FF;
	Thu, 10 Sep 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789082083;
	bh=ynXcRK90bwro/7kZ1phM1TDLTeSmSfDe1jpYuYGq8rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f5XMMQlD2YdNIKsS4xum2uADMCyiUPs6FrtXXE7GgGGWEuZeUjNVEXtn1tmt3fqKt
	 Noj/G6PDU3WtRm8nUqzITxuK3dqhpcd0GFCVsLd0QKb0hw8vj95Euu/D2Zt4iZGtVD
	 tbDqNyarFFPPi7aA2mKRYq8kPFQaMTGe8S2Wqv5C+0V+vFYEcCwhKlYhJ98APB5d1T
	 r7S8/aLJsJVraKX2IrsAm1OG56k/HAw341q3EtdYm43pmLsw4pFpigP92gFU8mlOkV
	 NTZ291aekcmw/HdPknDOj/QluOaFxpdAStO/cK4X7SuSmnxF7MVq3R8+xHfw+U3Pvi
	 0agjqVizXbiuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] ARM: dts: ux500: Convert HREF audio card to
 simple-card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-6-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-6-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:14:42 +0000
Message-Id: <20260910231442.C64CA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Describe the HREF500 and HREF520 sound hardware with two-link simple
> audio cards in their PMIC-specific HREF DTSIs, and name the card
> HREF-500. MSP1 drives codec playback while MSP3 receives codec capture
> on the shared DB8500 v2 interface.
>=20
> Describe the DSP_A format, codec-provided clocks, 16-by-16-bit TDM
> frame and active slots directly in the links.
>=20
> Keep each complete card, including its links, connector widgets, routes
> and pin switches, in the existing PMIC-specific HREF DTSI. The AB8500
> variant exposes six digital microphone endpoints. AB8505 has neither
> the digital microphone interface nor its VDMIC regulator, so leave
> these endpoints out of HREF520 and remove its stale regulator and pin
> configuration nodes.
>=20
> Select ULPCLK as the fixed parent of the codec audio clock in the
> HREF-specific codec DTSIs. This replaces the machine driver clock
> control with declarative board policy.
>=20
> Fixes: 4ecae2ae9535 ("ARM: dts: ux500-href: Switch HREF520 to AB8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D6

