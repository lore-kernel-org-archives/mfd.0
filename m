Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9A391E7C;
	Sun,  9 Aug 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270545; cv=none; b=KCw3aM6sSZhvoBLxx/O1nFxOcJocKxJYDOtggCZHuav8eEQ6DZWOMOYKhcfdzH1rp/DIQvC66l5tQAdsw+CQFfscsQbRw7ICBT6wSNNYX7zkbWqdi5Na2QwUIMZmu7vJSde8kx7X0ueRDMkcccL5EKtLew8RVG5ltT9w4ZATf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270545; c=relaxed/simple;
	bh=i2+3XZZ0WacEl/hiArBIjb5DOUxGVqo8ZdsbN0h8HdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fd+IEAuqwcSWiaWuXJwQePhdWVXxD5C29t9imyTc7VRX6+nBVPpUkOoUR+Xu0Q/9xXyIbKL9TCkvrz78954jHRmEOKxx/qRWXYp76klcxxW+I1Kd2RgemWLeg+pXURkwCdwzhB5fuRXi1Z2XqOrssQku6uv+lcJN1iuI6QdJmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3N0m7CI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3N0m7CI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AEC1F000E9;
	Sun,  9 Aug 2026 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786270544;
	bh=i2+3XZZ0WacEl/hiArBIjb5DOUxGVqo8ZdsbN0h8HdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z3N0m7CIKmA+yepIYpxFo7k1urADYQlYUL4C8HyDQB/IzGdDlWdXrcdLDQYBZyjUc
	 mcVVUdLQ7RIDW62nlPyCHzlYsZQ0bqovY7glkgT4lT5tY/0VfLanOR6Mi2yllQJYGv
	 yfTPv6cz4kB5mlAaTcdYTCq1Tarv/QfOaO3NCeIDknCeZzjiByjy3FCMI5lUCJbYiq
	 DMDFP64sViImHcAXB8SK6MkdZLX8dyhAwFZY67npJ2OqaYIwu5x1949vqUQ164sd2i
	 3V8+7D//qsgvSbeqn1ywGJkOhjhvvVzZ2mjMyPOubsRhLBUdi5kalu7R3reds5qKzj
	 NLV4dIe6no+DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: clock: stm32: add STM32H7RS RCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <PH7PR19MB6088AFA7804E27BDD3F00C5FACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <PH7PR19MB6088AFA7804E27BDD3F00C5FACDF2@PH7PR19MB6088.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 10:15:43 +0000
Message-Id: <20260809101543.B7AEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Extend the STM32 RCC binding for STM32H7RS and add its clock and
> reset IDs. First-stage firmware configures the clock tree for
> external-memory execution, so Linux consumes the active tree and
> controls peripheral gates and resets.
>=20
> Signed-off-by: Liu Changjie <liucj1228@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/MN0PR19MB6091DB524E=
7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com?part=3D2

