Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C53B14AE;
	Thu, 17 Sep 2026 22:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685730; cv=none; b=MQ0noAFBe4sQY0Pt4MbH4dG9QQAnSd5qYm4Z9slAVp7EWZFjV2rMMEJJGwq97I0WvcZ3N4gyfYxzz9mTC1bXnIdTdKjPjl94sak9rBNCS2v2Db3L+CLxOhgJua4xuYMwtT12aoaiCWiPogTqqjzrQKW9q+uotT3E0cehvdkEgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685730; c=relaxed/simple;
	bh=QQdj4xqADUPpirhYpVcA5K7+duxE8aeiGVfba3mnEq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FO87MjA1bcXlOLKt4F66w2oQb3fST4LY9mMoz+nDsoBrxOjbMz/gbpt25P+nDnGuqd0KOmXDodm4kEXIjXB6AIqBiKUrse03UyC3RryBs9o/v5ouHHBsk/XMDJ7qIlZMeUJnvojEjzdnSIKnSy3DpQ9Td9R2pxKBfA/2GSrIlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b46PUFM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b46PUFM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532311F000FF;
	Thu, 17 Sep 2026 22:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685728;
	bh=QQdj4xqADUPpirhYpVcA5K7+duxE8aeiGVfba3mnEq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b46PUFM9TetWYa5kKHOuzoqjcPv98u/H1QCxHw/79wYM1NVrg184LrUIaCPAtkcJ9
	 VQYubkLPWCVs8CTa5YZQ1J2cD8/LYI0JiwSMuXIfCqO14+VGfYsoYECYTDKmQMVxsi
	 jdf8JNFsoXJQLHnSqc27FL+ZlYb+i+LHANmyuf2JMqkare9rBy3YfFkjeoSreKjxlO
	 Mz/MXF47YeWtgcRChJN3UmzRTdGFasUt1B3WbpL7ucZU5rP63aUbrFlDWcT4VQG2tK
	 nWePGPJQ7Pcbr0j98RmNJcWvBdOS/vmldeTkMStmHcaWJXFijDbrf0tFnjv/seeFH9
	 OVmyyTzcO2Kfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 22:55:27 +0000
Message-Id: <20260917225528.532311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Describe each MSP as a single-DAI provider and the AB8500 codec as a
> two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
> and select the codec playback or capture interface by port number.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D6

