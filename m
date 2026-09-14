Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA1481FC7;
	Mon, 14 Sep 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399478; cv=none; b=s0QhNI9eeDNHIU584AaiZVaSecqqqAhGQRg10Iq93MKEu6nHeAMCBXenAiI0/j8pEzUWxSKPz+KUM/+eRoxQrPXFhCBpIfiTmlORMFfUWLqBAqpHM4Vgxblj1z0gay8ZAoBdGVTrZZso91bXPED71iKgYnKHyMhtqV19ZRUUzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399478; c=relaxed/simple;
	bh=19I4z31sQyHY2POmXfnl6nuCtTPjg8RDhfjs3VV3vlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UcjA+Qicn5UlpsRCSkeHQ+FAq+2Luw5pj6h5784iigiRQMIZzg6/Na1MJijuVtRNAwfe7ibpMFtMhsml0vgJT0v8z5Mw8eTRTlhVNwvKulp0KGUCE3iy9sV/Nkf8hukdUymWM6s6WOGijvEz9H0yP0d9KPwQZyXqGIhd9x1oVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpnXmR9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpnXmR9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6441F000FF;
	Mon, 14 Sep 2026 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399477;
	bh=Cr9iIi5YYTlsUc/l0J/cJT2DBug/lhbFzVjJhc4pn+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpnXmR9MXuSsJx/7tdbh9Df1u/Bb+rmUq49AT7HQbwWdo10jBFXyz6N3mgssRPt1q
	 MRIFJVwge2Stx2yhgxBF67xA42tWZZ3iKtVEwtKmuANIeywQD0eyW0IvWUhDFtdnf9
	 dwviQYTvDd0JhxUsbxwEMLsZ3fm6w3C/y1rjtIFg6IKnGOvVzaYUgiMBZnnibjoYCi
	 xL5HhWmrPuYPFFDVZem2CljwJ2Jh+k5Zka0VnOjtkYiaHzX/nIPU3lT/ZEajvxqyFj
	 2JQpzsZ5Q0liNF2vWatXYQfDUMf/yKnTT55CLlYsJdzAqKt+Z5UbfCct9X110XpitB
	 FjM4EC+VLpv6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-7-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-7-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:24:36 +0000
Message-Id: <20260914152436.AA6441F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>=20
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D7

