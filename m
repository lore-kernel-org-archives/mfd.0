Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553252;
	b=l4G9bNpkKy10/FV51B8Lyupo/fN3Yyu5/plEDxhJADedo8Q60R3FE8HDfph8Jiqx+PS1
	 xaPD6GeS/VlHJEzWg1UzkFfcOZ13tVRRYKIJT+IkbXvcSXzndoEUzO1xsXiS7SuSYVJeu
	 nR0BByQ+HMpn/5uXa+mjaoVNaRUuiFzUW7HUV56LbsfycOYOnlBgutf9EijdvnF5SwMYN
	 8ArPZ/DXUZA/kNc+Isx3M1BgZE2ZOD4Lut6HQEEE7Ph2mGYLQJUtpB4SKYaQTDCpJuS53
	 qJfNoVOnZF5sBw6QlP90XZVP4XOKZOwWh3rFnhUMZ+7pzjtcHthxi+YpQK6vvVv1Bwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553252;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=PRfJE8GxHxVJ2EQC9BwBA4K3kl6PgE402eg5bYUwmUw=;
	b=H80vbnKW7Ab6Ib3G9odlbzy9JJlvJD+1UOnKEDX2b+wihQ37PsdQTIlOut97xc2betVw
	 TdatwduWJg9sz5ZTEIHnNg1uiHr+DnDwIghNOzeqryXm/7KCk7cpIIaTHP7KV+mTK0/v4
	 XEPhuUE5OTvWdBk0c5Occq377rP0Nln9pN0L4EgrA6Yc/A60FR8FG6S8xwRXvt/x2kp4s
	 WJk4obx+KozBgz8mgPgSaTxG+tqSSE5KlL44YXWLjzHP2dZkOHAp8jMOr549k42Yev0jD
	 G8eI1ucoy6rEYnsblrRoxBZTvy8wA4Up60oFeVjb/oy7Wue9R4SvgQrGbf7AG2RYgEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=InJ53J6q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A8606A31E;
	Tue, 24 Nov 2026 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=InJ53J6q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DB61F000CF;
	Tue, 24 Nov 2026 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553251;
	bh=PRfJE8GxHxVJ2EQC9BwBA4K3kl6PgE402eg5bYUwmUw=;
	h=From:Subject:Date:To:Cc;
	b=InJ53J6qQfLulBuU25OUMAr8+UfWNKTRm1VH+e/FX8P6lKyqWEXaJI041fLRXXfQm
	 L2Ws/RySDXQL0k49k8+bP+afb/QEISxqmX2UBI/RMBNDH/aJ309/AK+rt4wkXrj90Q
	 GEvHev6xLj7eIP/QYstU8MWIrELQ4uYmnYqkTGFc8m47saJBsLKqr1zFxRjLtZSRpy
	 VrpWpsSuQP7KpKX06i/r7e6pCgPSCndYMGFSr4BYD9TyhWMEEj2v6ivB6hV3cpGhJW
	 KVn4RY2fZ14QqiBA9/OmaZ4Dk/Uyd59/jXZp+JvAILS6fDVIxrqfma7WQHSGChklsv
	 qy5wLB49ER7og==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/9] arm64: dts: marvell: DT warning fixes
Date: Tue, 24 Nov 2026 14:46:33 -0600
Message-Id: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBREr9L8tZhCjUVX3sN0QeHTopWaTyWah
 rsLde3sXjLzZoWA5DDAuVqBMLrgZp9B7CrQo/IDMmcyg6jFkecws/SBPRRFnCbWKBRcS6UPrYE
 8eRJa99501+7H4dXfUC/FURqjC8tMn+0v8tL7o46c1ezUyFZKZW0+utyRPE77mQboUkpfy+sTH
 bsAAAA=
X-Change-ID: 20261111-dtbs-marvell-3ae21c8ac47d
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Another batch of DT schema warning fixes for Marvell platforms. This
fixes most of the remaining warnings on Marvell platforms.

It's best if the whole series is taken together.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
- Update the system controller compatible strings to avoid using the old
  legacy ones. 
- Drop patch dropping 'phy-supply'.
- New patch to rework ac5-98dx25xx 'behind-32bit-controller@7f000000' 
  bus.
- Link to v1: https://patch.msgid.link/20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org

---
Rob Herring (Arm) (9):
      dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
      arm64: dts: marvell: Add AP806/CP110 syscon compatibles
      arm64: dts: marvell: Drop SPI max frequency
      arm64: dts: marvell: armada-8040: Fix node names
      arm64: dts: marvell: Fix w25q32 compatible strings
      arm64: dts: marvell: Drop unused USB 'phy-names'
      arm64: dts: marvell: cn9131-cf-solidwan: Drop st,m41t80 reset-gpios
      arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link
      arm64: dts: marvell: ac5-98dx25xx: Rework 'behind-32bit-controller' bus

 .../mfd/marvell,ap806-cp110-system-controller.yaml |  59 ++++++++++++
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      | 101 +++++++++------------
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   6 ++
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |   4 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |   2 +-
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  10 +-
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |   6 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   6 +-
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |   2 -
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |   2 -
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |   1 -
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |   4 +-
 12 files changed, 127 insertions(+), 76 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261111-dtbs-marvell-3ae21c8ac47d

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

