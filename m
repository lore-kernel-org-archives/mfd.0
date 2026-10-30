Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341745;
	b=omgJhT3fkTsy4jhLLn85SKEXY0cfSumNQjXMXUDbzJ2NN/m4jn5R4SD5O3iAuVyIkfDB
	 gMyHzfSZzNJPMtC/s3OTkRuNxKxNpU3tmW3uEXuvm1XZY8oMhCr87Y2fk4PVqZkNvcZQW
	 I1eET1JUMHhjmpdHERJlD6unhh5snO1DbWmOxBp/ji+mvUP6MuhjLRqwffbVL8VH/OL9i
	 7AEg02pFtqDWi2FF/y6p9XYf6Lokwb5shYacwhxQ4Qys2EciyWOQ6avZjjZcgSDwyh9ea
	 2cEhmvDjLTDdFsxmQa2C3cWGRKORW/Y5DQJVlaof8pteLoZ1C26JSEJRe0HOg5QTqSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341745;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d4DcjF5OB875rW6tf5D/FyLzXwpk6XGvkEimaPfmcus=;
	b=F/SWIkuqtmy/k7Ia1TbjAfEzUPXmzAuUpkpjecixhEcr2R8hwFVi8CEISdQni5SPlPZ2
	 RDVCpazxqHReXZ5Xb5OKV3qM+YwWlG6ey6E2iZVsauBxvz5YEvW3wfYb+Y7puf/moY5Ve
	 DJkadvBYIZcC70x+jy3Q0ZGaqBWJ2AUCRl2xzscQJ00qG3uaOMUr/xvZzOcvXCiokh8AB
	 q2RmKOhWh0qI6fns/elEKH8uk4LWe09quI6ug6F8LOkPIy2sTaFIlyPWuP5EmfVqfZOt0
	 w8VQkGc45f7+JllVPlN29FwsWHVXxZ8vHKIu8Qzwxj9f5cy4cjj+WG9woPX0V0EoHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOOfBZPx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CF606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOOfBZPx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C5B1F000C1;
	Fri, 30 Oct 2026 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341744;
	bh=d4DcjF5OB875rW6tf5D/FyLzXwpk6XGvkEimaPfmcus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOOfBZPxRHkUFtPQNWF0QBDE70AJTxCCTgheuk7KjA/8cZGX5gwUp1NEqbZ4RtwNb
	 Mph3P9R56tvk3zsgmQ1/EN4yYiMY7N3spkHHkVYigNbZK+vmo+palBgNvpGcrmXkt5
	 T2SB4v96oEEvk/8kJ1vNEsu+PgLqiooGTCp8rVZU+m+JCHCLo2nBVGoumkOVzxxmU8
	 TzDOcS5nG+uHU2ysQ64ihRpoHXd1URNXJOxANeZwOS3q8PO89zkVX8eLJbfhX+qF9P
	 kXw6NfWdEgPP7tCQIk2uJpzVTc7MqhvwrQ4SWIN/SFA2PU5DhtXKAbkg8nnp2UetUz
	 WB0XwUA1RogyQ==
Message-ID: <sashiko-outbox-190600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] dt-bindings: mfd: pm8008: Make interrupts
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-6-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-6-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:29:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some designs integrate the PMIC with the interrupt pin left
> unconnected, deliberately. That of course compromises some
> functionality, but the core function of programming the voltage
> regulators remains there.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D6

