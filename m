Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EE30676C;
	Tue, 14 Jul 2026 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050330; cv=none; b=HKvKjclnc+Y63hy1eHktzsH6XzviBma6jr8T6CqvKRn3gtyNM04TcMBYlMVsU+uM3l8LjUuHXLCPnH7VzvjsdlNuPuLSTb2XxjncOtRUjRoutxGDLRguyefXMKSdUSTBQfie351cZJahUHnBghY57G8ShkIP8sq0zsKHC6efiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050330; c=relaxed/simple;
	bh=B8L8bTuTtUZEsxyJp4PEdlhsVDFkEZBB0Av4OcEGS8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tg/rTdj9TkXcndIn0LYi05kVpzS3OEtXETgKHCnJyU0V+wd7PedBVUyGDesmVZGkGwUGT4+P4/+g9hgzAyh/Sr45gUv6V2UajvoYKg/aYImq+KLU7Ro0Tv1AVnwkRm3OzyjEjKzE0oivxaVafBkr812Udj0n3tyBf+vYU6r0nKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+gcVSV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+gcVSV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD291F00A3A;
	Tue, 14 Jul 2026 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050329;
	bh=Sa1oHP4z8rB8fFfAggfhIzQGjSMzzOKFUedKSoxTu7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+gcVSV3NBGFmEZwI4W/pbsYDYe2GrdTCN5ZrvxMJDHRxR+/eH1a9PLil4qe8xovG
	 hXdpnp5NmU1qJzWdktz5lbMnFXu7eZFYnQ6c/4Ey+5iFeFJCos82hzVbesj1bAzcfu
	 5uDDB3rSkfoKEnc01P0anCQsNNXmtbt+seZKqepLJnwzZ28DH9HigLuifo1w1UKucG
	 12DkMk1zCYkGW9aeCkODzmfpKZvjFa5HMRIm/WhqosTGGbED1EhlHqD8o1JPADFnLA
	 CjTeYlo0ZgxpM7SwwvLe47CczvbVaK+P2vpYz6NOIaS0FKwiurcC0wk3ubs+rqnGVK
	 pu9E0m2uQ2YTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-11-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-11-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:32:08 +0000
Message-Id: <20260714173208.DFD291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
>=20
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>=20
> Support for these modes is firmware dependent.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D11

