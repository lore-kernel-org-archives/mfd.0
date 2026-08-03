Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB7237A4AB;
	Mon,  3 Aug 2026 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751634; cv=none; b=f6KqyFVHy4nzxzMHaaQxt0ytjymbneAoeXFKjbl5BJg71d7eydU9u7Ae+6xGjLk48Q6u2ik456UROtJHERtMxEJGBEIeMQp6pBBxu/zxfFnSCOkc8/qevqa7Sw46RvE4WZosRBj6e+KQvNFfCZ8l9cr1/tp8Bm3Lw/Bk5KvKYcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751634; c=relaxed/simple;
	bh=GdQqZOi4ND+1/unqnyXFto7IZBgcdQSV44dixWna04c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r760QtQoVnFdNau2kbDRI5Hg+d6CKRJDkGylanGsHv9Nm5KnnX8BPzn0Su4x3f4WTnrLfoiQSHW8lCKbvDDWRC+cH9QaAfD8YpzSUK9V3/AA2hajzClI/NAZugSHzaSpH/VJagwC8fz2MlO2aHrVq2ctGn8RZGVUfDpnkRUiloI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd7QjfrA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd7QjfrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536411F000E9;
	Mon,  3 Aug 2026 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751632;
	bh=GdQqZOi4ND+1/unqnyXFto7IZBgcdQSV44dixWna04c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wd7QjfrAkAUxJkaXYkrAFclVjph2mDiTRWh4EuPkxPGCA8FFQ8cN2Sl4sKxogdlmZ
	 IAoqoQWj56Y2t3kkg7ImtLpLlaDFgpmk4ig4RfEJ1qPFl7PnWtULDD2kArwQaIIBzc
	 xSGF23DNYpR36nDvzH+39J9+wZvDBV+ymfdPFAVEBKBTcAissjooMZnK+1h4WNV+U7
	 yMvE/nBdVXfuazB95YwFP2vkH5H1NSoYUW2PNnJMePjcIV6XyNsQkvOxECnMucTfqP
	 EwIXAk/jDoGR7233BNO7PkO+A7mUYccopoKgYweyqtCeO1HUEUctYs6ki9z0ddmGUM
	 dtoMQkwhNMCQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 07/12] mfd: core: Add firmware-node support to MFD
 cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-7-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-7-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:07:11 +0000
Message-Id: <20260803100712.536411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> MFD core has no way to register a child device using an explicit firmware
> node. This prevents drivers from registering child nodes when those nodes
> do not define a compatible string. One such example is the PSCI
> "reboot-mode" node, which omits a compatible string as it describes
> boot-states provided by the underlying firmware.
>=20
> Extend struct mfd_cell with a named firmware-node field to identify a
> child node under the MFD parent. The node is added to the MFD child
> device during registration when none is assigned by device tree, ACPI,
> or software matching.
>=20
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D7

