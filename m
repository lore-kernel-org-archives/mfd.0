Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E5371D15;
	Mon,  3 Aug 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751999; cv=none; b=LfzqbGF1B/69pduQPKAPNp20OmHySs2phvZyl4jDSfjUcES51vwZFsbH5AJ3/Siq4STI5FK92ApOrLiHfP71K83/XQiimFDTfIdL2nvbZkka3kUIOk8n+j8gK9saXCRt8lNKD/Ql0dqhmIhiZPSMmwrhzkqj1tOrzGwgZM4SPVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751999; c=relaxed/simple;
	bh=qL7i8h6bh/meHM3nsJId3tksO6DyBpxxM0G9DMFzQFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ugp8sjRskxWACUYNEwcg913bXci8hWWwwaFDRNAXXLVkeyI0jS/cQtE0e5/MN3rVDsvu9HpkGsEpwEvUkcNILmNo/D8SvwYzbD0+TJZ7Ee3g68Fpq4LbDCqT+CMKTEMOaBU9OFQcrwzxcxHPXhhITBGOdWkmgcJAbMhUaHPC4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReCbRC6I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReCbRC6I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1EE1F000E9;
	Mon,  3 Aug 2026 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751998;
	bh=5TpX08PplGJOCLD5YzjkvIIrrsb/LlQnZWOeZ5DzrZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ReCbRC6IDYjLWBLSGSmB0MqqzLeF0qKIBF/L/0RmyXBJhkYUTlPjHw9Px+EvBs2KE
	 2JkFIfyT3Fk7qhg+bcP5FI/1idxj/GaTJPkD0PPPMNNIJ/xjWgQ3yrQbXEc9PkV4qM
	 vlkGeIFhaYuD/w2NLINmrz9OXqgqNkILYSvZO1cTrNuCizF3iiZYuBE1kZbI7u/6rV
	 Sj79gX2BjLzNpbHePPduToO5VM2ppfjKoQRkhJHS9XQ1kyRG93u8O8VL+9UpqdbJs7
	 k9fip1lY++h08lXNxPAt7uEpcozLANwQrLmFT9h5bZ8E+fxLt8qVuqsvYcBD2DeYZ6
	 8wlwD+K1l1nHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 11/12] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-11-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-11-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:13:17 +0000
Message-Id: <20260803101317.CC1EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D11

