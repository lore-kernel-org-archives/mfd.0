Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B32185B48;
	Thu,  6 Aug 2026 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983568; cv=none; b=gmCyRduD7RqC0OE6vx/Host2rpF2xy8HySk1wYUMKJWBDrmb9DRPEo9cuqk0OjhjTXhOoHPpExPhE9eGSYJCLoTdR4Jsas8GZa4UAwPmC3Il0IaSGdsh0uERMm24JBNmaqflQJ5VC2XngYQ6fLU28DplfCKML40Gl/KYtz6g1ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983568; c=relaxed/simple;
	bh=Vuv3qOyqO5XjHNODod9hNuzWmcE6pK3nUwJ3ow/XoyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hx8XX4ev6MgiFkVN4MRBZUwDxvn4p26VMXZ18f+QBBV7mGEpqw6jALCYZQhDp8yG5xBRI8SAWULWzzIAp/6IkwqaneFn7N3YY+vCDg+7/xbvVnpXwEI42H3OiEiJHFpWIS49FAVSYlh3dj7AVTNYhUL34i0G7iRD+jGxb17wo9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAh0oKTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAh0oKTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6C11F00A3A;
	Thu,  6 Aug 2026 02:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983566;
	bh=Vuv3qOyqO5XjHNODod9hNuzWmcE6pK3nUwJ3ow/XoyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAh0oKTH1jc5O9WDThJyzy+lmWBLUgoFxRMjg0Q0HtfRY/o3dzVRcVuWhlLPjLLSP
	 m/xzlq8J5W1Ag4hdHLQGNccuWlejaZDH3qWT7mz1kl2D4wLbPcXTKmCWoyE+qOBvDR
	 S9YU7Wcqgj/U4jHJGerp+O8mA+97YP7CFm4qoPZeWBxPqnEB05U56UUqHked5O4fU/
	 Uz8h6tF4AjhZA57AyeWV9dCI6+BZYYgtTXom7kxUe300r4k1YiOv0NhataRT7WYl8m
	 5FfOUCjJuehWQqFvdvXiH7xWCrw5S7pxVXDnqHredRu5NiMT+j1YnapZeY+ySGn/xK
	 7GDHMFmJ/eVtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/8] net: phy: add X-Powers AC200 EPHY
 control driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-4-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-4-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:45 +0000
Message-Id: <20260806023246.4C6C11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AC200 Fast Ethernet PHY needs package registers in the parent I2C
> regmap to be configured before its Clause 22 endpoint becomes usable.
>=20
> Add a control driver which obtains the calibration value, applies the
> vendor offset, selects the documented 24 or 27 MHz input clock, programs
> the link PHY address and performs the required reset, clock and shutdown
> sequence. Use the optional SoC SID cell when supplied and otherwise read
> the AC200's internal calibration eFuse.
>=20
> Early PHY creation occurs before a MAC has attached, so use reset-default
> MII initially. A separate operation later applies phydev->interface; when
> the block is already powered it changes only RMII_SEL before the normal
> PHY soft reset.
>=20
> Expose serialized, idempotent power and interface operations to the
> common PHY driver. Enable only the MII I/O pads in this basic driver;
> dedicated LED outputs remain disabled until a later LED patch describes
> and manages them.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D4

