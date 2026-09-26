Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CDE43CE7B;
	Sat, 26 Sep 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426952; cv=none; b=V5rMAgY30zruhhxRn6nQn5sJBmc8Ba34OzFnUWrbnky4k82w5gG97WbrJ9vOIApm+/T1IYdKctxh6FnurB/aOL0PdrP1TZg9vpfzaimIe1SL4EJ7RH++Q5QdYLUmvdM+oej7lvpzH6SlKbNaUiCs2uetn9UUu3bjbVOD/Rovhlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426952; c=relaxed/simple;
	bh=SdAScHlDTGngsrb6jQnbs98Q5AbH3E67y9g3O+4WQo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rGo7LmHI1bJi1a7YLC3pBPP9Y1IKc1Q+pRASTvaZuNLG8NR3B8Ee6VMnhYNoMZpOv9d3KklJ9aezepsEHSlPQXYl1zEeey3T2IzcIIe4ydEyz3SfzqoPHkMrIlXLFY3yuOtpUYJswt1XyhNMj8AMqN44f0BUhIt1nRwVCBOOgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB/XUidL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB/XUidL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74041F000FF;
	Sat, 26 Sep 2026 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426951;
	bh=S87pLGPWkz2DaOiaNX+BO7EKNwXYqAVpCf1J+ditZWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BB/XUidLpjcWnKS9euMOsUc0/NVpKHK5aWNbAVLB4ezci1YCbaMSnymxDxmMGLJFl
	 gOC6gGkgm+UZoERPzBID2CKSbvokiqMPcp5yNgvb1jf+UZOunheSdbpsUrKhiH0Li4
	 F0FRJI2BkMciSk54CI/DtEYn5Y4BvSaNkXikWpnshUYIUqJ4kTqDrEaaxfwHJfrmfW
	 R5VAIt5/hvwDth9PHUHi2wdbnzxXCb5TvE37uw+m92gH0oVItJ5jOYxC/XU3uIP4R6
	 nd+d60z7GDNe45v1oFZ8vqzrRnqNdugPoxoVi3k8OLwRvEQhuMDBqo9QrNMlofppSR
	 6oB7Rb0/2D8uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/12] arm64: dts: qcom: sdm845-shift-axolotl:
 Enable USB Type-C port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260926-typec-v1-12-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-12-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:49:10 +0000
Message-Id: <20260926124910.E74041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> Enable the PMI8998 Type-C port controller with a USB-C connector
> description for the SHIFT6mq:
>=20
>   - Sink-only power role with a 5V/3A sink PDO
>   - Dual-role data with USB role switching
>=20
> The VBUS output of the charger is not supported yet, so the port can't
> act as a power source. Describe it as sink-only until VBUS support lands,
> USB host mode is still reachable through a PD data role swap. Higher
> voltage PDOs are left out until the charger driver programs the allowed
> USBIN adapter voltage.
>=20
> Wire the USB-C connector port graph:
>   - port@0: DWC3 HS endpoint for USB role switching
>   - port@1: QMP combo PHY for SS lane orientation
>=20
> Switch the DWC3 controller from peripheral-only to OTG mode with
> usb-role-switch to allow the TCPM framework to control USB host/device
> role based on CC pin detection.
>=20
> DisplayPort Alt Mode is not advertised yet, it will be added together
> with enabling the DP controller (mdss_dp).
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D12

