Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8D15A86D;
	Sat,  8 Aug 2026 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786164729; cv=none; b=oIiKBzyOt42txb536nhxy34Rw238GuztO+8vXh4d2FZGWRsZKDs0XoX8LWr9Rrw2rbOCZ6uiMGgnLBiHZ7MFogZwfW3dVrU40HMEONlsqfOBMKbGpNcRL5XbfqBbXacOoseQjZ2xBa6pMk91bdzt+kluPiKmvc9k1A+BHqiXZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786164729; c=relaxed/simple;
	bh=N4CF7m8ypiGlzTUQHH4FLWYC+jhAoKrsgx83SGgpV3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hzBkfBshY1XI+TiC/JVSAkBLWsQ6BWj0oad0/LkrOEyHcNNB+y7ZX/achokhUP9BO2BxSxobD9xky19i9P5+O0vs9YjqySK28QpJUCWV2Hyx3KqDq/bP3eAVIQlNnMIJBp1F/YbQDsRVtle3gOr7BAL8Xyt6i5cbsIlHHsJLqrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuGTYIvs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuGTYIvs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F391F000E9;
	Sat,  8 Aug 2026 04:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786164728;
	bh=N4CF7m8ypiGlzTUQHH4FLWYC+jhAoKrsgx83SGgpV3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CuGTYIvs+NtWy/MF/PCoyV2PIevfcOWuZnkTIbRVzewgNTvG7SDHu8N1lPIknF2kK
	 dH/weeR2PFTbNM0XaouzuohjchTr1s4YRo7nPusYQQeWh+e2+2yunCv5lHcHzBv1EV
	 prltNr21P5rVYHg9qDmmHVD1Xz0aDvgKvymtQGviAiQ4Y9rjbr1JT0L2yyQumML09I
	 Ie+ulWNOMgYj9hGF7nBt3SKIoW64uZzVNRSeWlFngWURyolSjK9o/n2XlH+yhZMc2b
	 YJtbuTW+0VJ00c56kdN6K0OmakkDhcFoMUpRSc1c0Ie5bSM8xHgU8gvFXnTGK0Q2l3
	 pReoREpIc8S2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-1-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-1-9bf2f7441632@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:52:07 +0000
Message-Id: <20260808045208.21F391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
>=20
> Describe the parent device, its input clock and the four package
> supplies. The Ethernet PHY is represented by a PHY package on its MDIO
> bus, with a phandle back to this device for access to the package control
> registers, so it does not require an MFD child node.
>=20
> The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> matching the rates encoded by its documented clock selector.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-submit-acx=
00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com?part=3D1

