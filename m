Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8A431E51;
	Tue,  1 Sep 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276883; cv=none; b=NekCNnQjdlknwuHQkHKCunExdL2aiaZvajGl0MM+xYGJa/Dj9kKfjfldfMFVtHbGE2wpxphVD5MsLmZZYZxc7E6uG20wADAdGfS86lpfLue5FDDnAe7KrqFgQHzq/vfhGJ3XMgzp1YP8QOd/pQ8apDsGvetQLp5SCNxOseCQlxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276883; c=relaxed/simple;
	bh=iJ+X2jSfLlD/ClAEOY3xrAUCGD2t34NBFIzm+jq0Nyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M1iDTUJDDkOC1KzFZ15/CKXN/JlGyHr6XnNSdOryKe5TCkRZPMOkrpv8qTwvwuWZNCpsZhWvVyhxLot/hfGQkWXMBKT/dHnshU/OY0bmEVsxhMF+r/zWPzXSWScxr033VYH6vvRz6ihuZZTSLdlhjehNWnIrIY88q2f78qWIRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMu4k073; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMu4k073"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2101F000E9;
	Tue,  1 Sep 2026 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276881;
	bh=iJ+X2jSfLlD/ClAEOY3xrAUCGD2t34NBFIzm+jq0Nyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IMu4k073jbHpChZuOafZlgvz3hmj6Qvfl+DMbHTIL5Wri3IiBh0eTb/5xno/k0QY9
	 SNxAOuQuJr28w5TyD2CTmd0UVjj6vGzEJad1fwGZHS19T0bEEoG2sij8ITgot6MebM
	 Qgx3bNVhGI6CKjcKURRdzSwsyuDjw758q0P7yT88nw8SU8a1GjjtvLknUNdY4mB6zD
	 5OjfUdR0c3KI6vm6b/sxY0xGT36VbPTln4cmpl41wOMYbCXOXyP0BZUmHfVZRGKCoN
	 L2qgqXYOQCm+SBC2OBabPhUmT7fk7Rw93oK+q7HfHA33VHHshMcXE84oa/lQEZc0rl
	 EA9Vm3mSdV7IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-6-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-6-aecdb9955a30@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:34:40 +0000
Message-Id: <20260901153441.3F2101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Enable and configure i2c MCU node to get fan working on Khadas VIM4.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-add-mcu-fa=
n-khadas-vim4-v10-0-aecdb9955a30@aliel.fr?part=3D6

