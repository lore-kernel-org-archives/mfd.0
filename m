Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FC43546C1;
	Mon, 10 Aug 2026 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345803; cv=none; b=muehF71y8FRB5gMkEx8/DWUZTMqHvfQ9+Cp6FVDQc6f9sj3kmQ6nry9VdOgSq/AERCPEjIypSi0uiK6X67zS4kOUEgTrPQI2KkC+0X9kEyywMZvNBkb+vGMWdcwTbCQaG2voRvmhS0OQEWhCH8yLUFa9LwVqwXCBbWblOysQKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345803; c=relaxed/simple;
	bh=g3lwjN4KygzX3jeFX7hPkut0TaCZW427Ur4W0f5Nn0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YLoQxzajzQC/tCGSAYVsXlvye1N4qhoEerTKVy2nGx5CZZXt/Dw069nDt/Yspy+TnpqnSX3zqZjXuyuIQqA6p4v9+HFPAlIm3sWL+GFs47yuWWOvCR/DfiwVGq7cnstB1z/FvHTa1Iv9flBdCOHNqCrSMm9A0PGZgQoamzscwlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnzxQtrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnzxQtrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03461F000E9;
	Mon, 10 Aug 2026 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345802;
	bh=g3lwjN4KygzX3jeFX7hPkut0TaCZW427Ur4W0f5Nn0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dnzxQtrv0uE7zewB5ZKkhDs6WQckYuHI2IoyzqGJ4QLS3RieFl9p9LoNWEKLy/iQt
	 mRqeiX/bVHr4A5MPzs5IeIkAdWq3LSuFubewSRP8Yb1kexgP00skBuBB9H1dRc/RZP
	 96Wi6KcvMKZjxou3HhAYjJMwmkbwAm/JbpyWkaDHZ1MlUKnmqf/uGf7HBUTQh5Ba2V
	 +OCT3li/OKRm+B7dCdN8F3BueQHxPjmGoDab9gDeI1zEzoKL/KKiu9AehHJdm2A7ev
	 OfKJmbUbYCGMvcShwPAiEMY5XqB7PGk+4BdGQVDXQ/JUBtwiGjwQd1Epv/u+QhWxK0
	 +pDI4WO34vedw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260810-zx29clk-v10-4-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-4-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:10:01 +0000
Message-Id: <20260810071001.A03461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D4

