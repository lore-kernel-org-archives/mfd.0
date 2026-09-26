Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007353290B7;
	Sat, 26 Sep 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426742; cv=none; b=e9neGcJ6rZ5XuHTrwnexxIeLQac3unUDoIdfY84oFFuL2KI8S1X3mIGXcTC+7tnF9EdqEHGbCb+DkZB28vsC674a6Zng9YWosNQeWD8mMIzb8nW/YMwFdlW4gJCwjxJR3h9Rad90gMBD5w9peLcAxZnKwtxVQqbqG31bTy6519Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426742; c=relaxed/simple;
	bh=W83KtrF6U4tqCx3HM37WItQ3+pt+URk9m5oUKQi2ZVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kpXYymQaOwBD2DClqiBPTjdBPizFUHLn8B9XZfk47a5obTRNRjNSMisuOshTvb/Yv2bAnmkvZH3f6zIs2O3RCrqwoox1gEDS0LoRi1l7AtgCmWgMDTvwd61luZV9OXda1TPKo93/Nd+e/rjVHY+Am25SsPksOBTEwp9/VKVV3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyDpO++x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyDpO++x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C4B1F000FF;
	Sat, 26 Sep 2026 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426740;
	bh=donf/MUlPmn0OgLosJwB1RbF600CT2TOQ2+gcRgi91s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LyDpO++x2yKZOzJpJwA/6Dj7nZM5TajFqmDj+rn1hLBjruT/lja+oJpYuLF/CUs9+
	 z1Ea2RBGu5LnPM3AB7gfwCl5Q98yFAzW7UYBdZmgQP64m+nb0KeAalhfFZUJBJyPT9
	 gAjyQP01ZepwDaWPZn3CVWe+076+YVOiE16ypVyIBWKtH+HvrWqKxxzlrLLzBf4eBh
	 K3HcatYSd8dElDs1RnFb2TWbGRErbQkQC7xg3SvndcMpyxf4snJQguEMm8zQ0Pwm1g
	 1HK2kfh5ohqaMRxj3rKtchQM7bELPabyZkjCe2DX8PdLaEhfq6cd3XUVDlh7gh6Drg
	 7ftPlL8Dil3uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/12] arm64: dts: qcom: sdm670-google-common:
 Enable USB Type-C port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260926-typec-v1-9-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-9-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:45:39 +0000
Message-Id: <20260926124540.58C4B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> Enable the PM660 Type-C port controller with a USB-C connector
> description for the Google Pixel 3a (sargo) and Pixel 3a XL (bonito),
> which share the same USB-C hardware via this common dtsi.
>=20
> The connector is configured as:
>   - Sink-only power role with a 5V/3A sink PDO
>   - Dual-role data with USB role switching
>=20
> The VBUS output of the charger is not supported yet, so the port can't
> act as a power source. Describe it as sink-only until VBUS support lands,
> USB host mode is still reachable through a PD data role swap. Higher
> voltage PDOs are left out until the charger driver programs the allowed
> USBIN adapter voltage.
>=20
> The Pixel 3a USB-C port is USB 2.0 only, so only the HS endpoint is
> wired to the DWC3 controller.
>=20
> Switch the DWC3 controller from peripheral-only to OTG mode with
> usb-role-switch to allow the TCPM framework to control USB host/device
> role based on CC pin detection.
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D9

