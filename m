Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A32F747A;
	Tue, 14 Jul 2026 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050379; cv=none; b=lkXB66vmeSRpHnnGAlzHL6YGejW6o7ho0MPUBS4PflZUvmhWJh8i06Ya+cEscObcdP9r6yq4KUfrdhCVFeGSbppdibqJjYYUvi3nZdSqUUuzrT/axzTNN0gmTZ1ZmZ6wSNliK3JZFoBj8JlnKsgde5+Ap7CqWlhuRUa1beKKqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050379; c=relaxed/simple;
	bh=y3vMpHdnn33xbLv7Ft08k8x7URzHRKpgbD98GBDGvdk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=afuTuJkEXyTmFSydGlZ5QZodtELMX1LpaztU/Xee99DKF24vS0x2GiQx64kLCYmdqr5/1/GfNdFCe1lBw/dMPWqciGJiARO95GoExQvmDBrgCDZXaGGKJPKuF8pBgBavzA3GGXawQv3FvqNTTLoMZ3FpEZTDyNSM0L4uxooEde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qaa9T+mV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qaa9T+mV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57C91F00A3A;
	Tue, 14 Jul 2026 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050378;
	bh=frfCY8UWOVjYUj3fgeNxLfz9/zB3L9Dh7uhBR3h+ySk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qaa9T+mVlstZ2IGvNPDmyEcWqBdYxmjO4ClTCh3XQqlveiEIAL6+sSoGxHyy363lU
	 dlNzT3cZp+6LYHJVe8bddrc70pctPqjUjix9qUyn14rSlGjDksYi6YqpeCYZ4AxQsP
	 Ylhqf5vDtV2+f1ZMtmZWYbla/Wis0mku3quTSpROmNgp0kzBX6XuOJYGBr3pygesMu
	 rJPRxk7QgOKSiRpMraC/9hDwSAy3DsYo3Fvb9O5lmfRh7JUPCLmiSDcqmrn99Ne9Qf
	 9CyhYCjp05V/0aI8hqspFHvnNdoRH6nkUqDLImn/eb1PBkxQeF8EyoxaOD/OjF68Dg
	 S67PDFqdD4Fag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-13-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-13-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:32:57 +0000
Message-Id: <20260714173257.B57C91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
>=20
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
>=20
>   Support for these modes is firmware dependent.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D13

