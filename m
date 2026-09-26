Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B55280A56;
	Sat, 26 Sep 2026 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426795; cv=none; b=h+Hvdd8+nb7VYjc27/GYLnqdiQrWltW8OMr0mdPpen3pSCNkbGz4UqDvclwafGb5Tn2PcQ1oPcjGYcth1YCO1GRsdB4I7vxRBGw1D8cKPAjXx4t4ebdP0h0Qiqv9pZBL8FIdSIAyXQHOdjRViwyT1uSIHpIWnFsWhNyLnZoHS1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426795; c=relaxed/simple;
	bh=ezaBGDEIht46euhDW5Glo+xalz1X9YsNF9txaXAGvek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HK36TM8WeH2xJPSwI5HgK2d7KkJaA6gbG9hDxXSlyOnKsG9sGX1uEq/2HazSfxdbqVeHAgJ/wz6fxSuVuGDRIifQOGY6X4NcAnStiPLRJeny5KJKaqqZsWyr3D+2jG7xdtQxA4djlGfqJlgzG43wdnHyLM/t/4fqJQQ64HTyJpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NO4Jp7l/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NO4Jp7l/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735851F000FF;
	Sat, 26 Sep 2026 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426793;
	bh=sfMxV2+m/DLQALSVZduBeFFZ631pU+soSnwR7LQi5xQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NO4Jp7l/Pog6jQp15AUR3aMuSuuQLgsMsu4fbvdxESY6Gy8PxL2uIfrrpsxWBJDf3
	 jRiB6eTqB9ocLSFA8sY3US+1ZQWaQKlRuLsGiLrXPKy2Pcbt+z1/XjlU8+c86EpdCv
	 8GoXAVbXBACZBMA2ZtNqfFa9Xh8vQ2D9TFTJXMwVxd56uLuBb0qBtSWIqM+1TQz0vs
	 MT6Tug29gNERcOQpnKz7tzEwUx9EC+ILnEdf/t+R6Qt8mb3mJLl7ogY+jv/rhM9l+Z
	 XqbQH3xWZMVbh4K1gwa4JJrSe4uVEtO07HdpYOJ3WXwnujcfV3qHB3UNrOtWKkfQhY
	 LU/9X0WCYiE5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/12] arm64: dts: qcom: sdm845-google-common:
 Enable USB Type-C port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-typec-v1-10-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-10-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:46:33 +0000
Message-Id: <20260926124633.735851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> Enable the PMI8998 Type-C port controller with a USB-C connector
> description for the Google Pixel 3 (blueline) and Pixel 3 XL
> (crosshatch), which share the same USB-C hardware via this common dtsi.
>=20
> The connector is configured as:
>   - Sink-only power role with a 5V/3A sink PDO
>   - Operating sink power 7.6W (matching downstream configuration)
>   - Dual-role data with USB role switching
>=20
> The VBUS output of the charger is not supported yet, so the port can't
> act as a power source. Describe it as sink-only until VBUS support lands,
> USB host mode is still reachable through a PD data role swap. Higher
> voltage PDOs are left out until the charger driver programs the allowed
> [ ... ]
> usb-role-switch to allow the TCPM framework to control USB host/device
> role based on CC pin detection.
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D10

