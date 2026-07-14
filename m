Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2CA2EB859;
	Tue, 14 Jul 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050378; cv=none; b=Kooe6IbYHXVcP6s9rzG09F//FEPux2+U9ZRvdqJboreKSd5bDjHZm/VdPn4hpDvvb/5UByC5Y3QMFVssWEFykkNjfcDwVuHBdtHRM+85K5E/sSSW3oQHvpTOr20upXfnkrWBF0m6wI92t3Yr0fYKn8u6g2XezLXOWHlaC1iSGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050378; c=relaxed/simple;
	bh=Ohmi1g0PK6C2Gidxw1LfaYR0zrBfXy4IqnLIkl2i1Uc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kc6IVxFcPBHpheI8TiEed3s8txuUK9kyndwL37AJ4l0EYk11C/4Ut3f9+X9ZGUzTieGOvOm/NIkgYR4W2KXa8jLZGLfVuS7TQyaIXBNqlOjRz8eNMdrOKMSaUt4AszStw9aP6ovLzKbqa++nTZzbJpPwLoS2zE3lbVj/Im7Uo7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjWJqxu8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjWJqxu8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA10F1F000E9;
	Tue, 14 Jul 2026 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050377;
	bh=mP4dF651cynxI+fNODQIXraeJ1DB+QbbCKW5nmoPbJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZjWJqxu8LymJ4JZYZqN1pUE9L66JVoPmFRl6C2b+xnBffMxY4ywi/FKCrJnsvfLuO
	 Z4JqcO+bR7siu25wZ9SFv+CjkpNL4OSkPCY9i5l+vCntHZoq5SQ4DLGpak0enTtStJ
	 7xkgV8WiUPzcSf/4PstIU7HECYgcPOdzbHXGlqc7mXj4daYUHCFozAmSwqR9MXS2N4
	 w+wtU7Rmb2w2NIImWBfKujZci0qLuxr02BbPPI84duw8hWSkvpSZmiV2RxvN3g2iVR
	 MihXQTvpF+UA4m8MqM9ZJqzV3ef/kE5Q7X3ijLj+xRHXqKwhGA2htGugkItLi0NzoY
	 Z4KojhYqBK+gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-10-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-10-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:32:56 +0000
Message-Id: <20260714173256.DA10F1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D10

