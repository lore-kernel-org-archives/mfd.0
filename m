Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD8476070;
	Mon, 14 Sep 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399646; cv=none; b=B3p1utrcG4OldgCOG5FYUZCE3Lu7ORnFKD3474TCpn7+kI0zKhpK4jAH3MOSwEr6zZZ63En3X1pdFxlvVgDCzOT1iPernSzrQZLg9aZ8R0ksFLLwINMSRj/CkiHxSEDWKNMpaWg2T74RHaonY+uXdL3kx7iUj5ebAu8oDWXmZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399646; c=relaxed/simple;
	bh=ipGVMV0/d5IRcxW47UfoP6DNHZJyXyCwyxCoYSgLTC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lQt3uUHouk8s8ppBFZ49OJAkrw+zMyoDUIzPyHmWkiiC2FAVxQI7tO+j1eR+1qsl8XUxwTh7Mhp1VuwbZPdlZC2eTFBj0jBBK1yB5hi2QdyWDQiDD2Ao/B0UJGM0/zw7+1oyyVcrRYFGUIuUIYxm9VZr6Ory2kIpikQbWFRKCjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdcmpnXV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdcmpnXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4801F000FF;
	Mon, 14 Sep 2026 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399645;
	bh=CCERhMRH2TfnLcNvF4gIWfU8cRzAaRLRNhWPPRPChr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DdcmpnXVicx7ypD6DPCXmmcHpZTKkwfQi+Wjyk6hgFypyi6kID3PfDfOgytz1SIui
	 oLxn4wAwP0oONZ3LvDxAlDhxMbMyrEC5Xs71XCts/nudRitVxvmI+dLNiQL3f0jpSU
	 4eFEdsG/TRJExyGYGrwFUcDdfLR4TqKATf51wWPaMmitg9SnurohmeenH4xB51vSIU
	 IoU0RZvmo6ayxBpFVS6535gz4eP7jsYT5pwzs7K84mgUcKkuisk7dGdf3kfN1696eA
	 hC7xj5yHPyfW++pqobeZ70ilTfpelHro28AT4WwjGOjyh3yp30ek6OPxoO+RlYo7Le
	 tYTwLBnuMU0XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-10-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-10-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:27:24 +0000
Message-Id: <20260914152725.0C4801F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D10

