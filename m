Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A674746DB;
	Thu, 23 Jul 2026 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807281; cv=none; b=HlIouizAaadwTpu2p7K+6sVb6O+onHF1RufQaHs/8Asv/GOjsRKa4P19stpEktI3WehiQSAYga/rdSjF5Hvh9QBDd5aNd4OH0gNNzu3+rwfUbaVRZjFQBw3n0312XDLYwh5kCo/14xIoYoaBIeHP8qjO9PAU0XFZmxCDVoS2gQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807281; c=relaxed/simple;
	bh=2HAvzQGrqD07VEjwEcNFLP/YKtrXeZ1beHHWENP3RFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F9fMqT5XN4V5JFzMFfh6pem0RwuiLblLZjb6dO/ncqrX+GiEOF8lq8CF3ew79fzLqU9YxHnUeyQxlCitK7aOXuHrkt5Ag4G5BsLz/fojH769Mk54WYfEeiaRpdSa07Tf6VlkmUCbsbE7Ir3pOtJ9w/eMoY+MQWRWXvkAoLMbYI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opVoIbSJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opVoIbSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629441F000E9;
	Thu, 23 Jul 2026 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784807265;
	bh=Ow2XPwZ3YNPTJe7csNdht/Pq2Y/yki9zWGHeSHHGR20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=opVoIbSJ+gP/NqoQ7GfhZ79+VyKYOQhiGITsvpbMDWc2YjJDGh172OnqT6dXBL63D
	 5DOIWLghHVak3OKiXAkpunL72eEmjcBXzp0Kys8SSm/6t2KMFaF+m20EhxhXwJqT8M
	 yQQyY6h87rgJzO26+ZGGSnb+iAOYdQ8Eet0nWsZcnTCwQyC5S7F/8FwkTddykyCup1
	 1Z6AH/9pTZS1ykoPZWnqKmXe4WBYrc5da75AW2rBZXnl9k9G4cW7Pn6Tp/XE35BJFw
	 SMhVbzpzDqv27VE8Kl0Yw5vp5d5AgFgc8UvXcOg0T7A89Eg9QKT218vlD47m4azlfB
	 IF9WwYJyhWrQw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
References: <20260710192737.1689453-1-mukesh.ojha@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible
 for Hawi and Maili SoCs
Message-Id: <178480726312.3379667.17255236799309866218.b4-ty@b4>
Date: Thu, 23 Jul 2026 12:47:43 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 11 Jul 2026 00:57:37 +0530, Mukesh Ojha wrote:
> Document Top Control and Status Register (TCSR) controller for
> Qualcomm Hawi and Maili SoCs.

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi and Maili SoCs
      commit: 74d90f4f3cb5046e362f0635a7469e2522241a31

--
Lee Jones [李琼斯]

