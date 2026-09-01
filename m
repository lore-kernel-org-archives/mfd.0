Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF49433046;
	Tue,  1 Sep 2026 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276884; cv=none; b=bY6kYi2X3jVGkCtXQD2V+7KuxpR8ATZa2X/WhxPXtQC5+F6HjS/HpiNmkqtbtMhfH7+SFtv5SlhbvXGa+CxEe83RwX8LbtQSLSw8wNXnZLKdiLcZM3A1cf1ZQOCk7MBHU7vMXQ3REXVTdILqoR7djDaWBIHap0oW7M+FX/0LjLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276884; c=relaxed/simple;
	bh=KB8SxKkAeyAktpBpzb38bUsu/Wbr0BEuYRmjC0NujWs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bs//MFGRH2V2scc1dIBpOd3QJN+yx9RPYbEV29UVDC50IZXIILK5xjkPCU2Q7CCoEebG5J8vK90pIT/tZjGfORJmirv2lPAwg6w3BR6remCV+qzG/PMiOXM5z0/g8fU87/92nKE51ux9qfyityn40GO8GL6kciHmY4MtxZOKB00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfVfVesF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfVfVesF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404A91F00A3A;
	Tue,  1 Sep 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276882;
	bh=KB8SxKkAeyAktpBpzb38bUsu/Wbr0BEuYRmjC0NujWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfVfVesFBINvfWGomE3Fo5JIAJTaoXgWIJFwcO1ra3CZ9JKCVMdJoy2C8zIKuuvZj
	 C9/BlYqMgMv2TSZGb8peA6qqTDQ1kNkW1lA9DFvvXY3x00Gr8Qu8A9v/6hLa8cBkia
	 kNt5Zaxd/HiW0UGcRyx3tt1QdEvHKh15CaBBXHeKxtpo3FoLVh6qpv6lI1GxrZ8BmB
	 f5ekwSrs+etl0fLOu6ibWEtaeSJxhX2N+8AWLGDJ2q5pHe9q9r/WlZIqVmrrhqc6uv
	 5zpE465tEbtDVXB+aDwFrFRI5A/SU8lNShsjlFsjhApkb1bLcHSlfBZVsetfIZGO1u
	 v8R2GzQHBGb3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] arm64: dts: amlogic: t7: Add i2c controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-5-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-5-aecdb9955a30@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:34:41 +0000
Message-Id: <20260901153442.404A91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Add the T7 i2c controller node used by the Khadas VIM4
> for MCU communication.
>=20
> Use amlogic,meson-axg-i2c as fallback compatible.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-add-mcu-fa=
n-khadas-vim4-v10-0-aecdb9955a30@aliel.fr?part=3D5

