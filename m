Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186390;
	b=ABvasDhFv6Z4I3Nk+ftTFMSbJJ4hHg176fWxGoF6QSOU8ZsZopGqy+R3bhiqy462EP/I
	 zjEERH80+VI3nUuq5t5xsxZYHLRLdYw9U/zaIn+RM18QTtteTvQt2VoEJhwjuz8HDAf7n
	 HMldOYK5+rm/yN0wj6rvtHPAGeu2DaRXKBMrjZKa6S4wenDDz7bljOBCulu03WSnYFrEh
	 0ls+qF8UTJxLlTHqsiwOkG1NllyPUcIZlUJx4GcIoWX8G3xCMw3zS6aSPdwO2QQawGpSh
	 SVcF0qxisetY5YcQVGCydGHTnSmBumiAOyicClNdVyCsOnHv9M0sscgWdPTKC3nWVcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186390;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc;
	bh=rznPm9m0btE1gbMkn+8dyUbHrzkHs/ylJyYClgeJKxY=;
	b=eK+WBnb4IoErWmXt3AlA+I4qvA71jLsTq23yoqo9JOp1RMgCZC+gu71ZhCyDNrVjyqzG
	 z1ZPGx+5KKvbUjzMl/Ydc4BVEEW6PXZiS3JFKu8WU16VdJb3dRRz0PTLMzlvIVJAcHVRt
	 JpL7H0s01AA0kBDVOXAvKGZ3xlSngITr0glxvE2XksvH6sPdbQg+K3yQStF8o36St7YL3
	 lodRUNWRTh8qiTlaOZHG5uJ6cYO+visB0AgZYlJppOtrUeqWruqabPswQ+zQc0CmySQ99
	 j87yy8D3yLAIU0OodLgyH4x7ZGe1un3ygtyHT2pIliVZc2dJw8MAOl0W2XIEhFZ+wDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=P3IU4wSq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=14K4YmqL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A1606A320
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=P3IU4wSq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=14K4YmqL
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rznPm9m0btE1gbMkn+8dyUbHrzkHs/ylJyYClgeJKxY=;
	b=P3IU4wSqixfCXF5D12nZ8k+Kp0RuQhQ1N0lsZgjt85h/I/RUnDLSatu0nd0rxlMBHqDvue
	j2f+0bhQp7N2pBOuGkNo3+Q3kg4kver+muMdyH7kPyMh7vHMUJCcXqQhaMg8KNJdADJ9yu
	D/cP61BYawPCqo7F2L3+K2cWsDJ+Fdi6yIlS7EiwUCx/5gVE2NSJWbzxwoLaSXKHUnGuZ9
	cFVQuQISHO6M04AtWYJVpHpCJTpdFokOyf6UBW/J+a/DlrGfogrrSQDs8VZagj7DpgOX+w
	woZBDpFA1n54+bOXiveohWYDHEXTRyrsKWRax0zF2M/0w2u54yy68C/Lq6ehtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rznPm9m0btE1gbMkn+8dyUbHrzkHs/ylJyYClgeJKxY=;
	b=14K4YmqLk5mMRZu+5hcGYIttY/SindoUXx0uW7E4M0yY0mVbAl/eSgITuBXYp2ZmZ1Oova
	0/63VjWPSF3bWjAQ==
Subject: [PATCH net-next v5 0/9] net: dsa: Add support for SoC-e Ethernet
 switch IP cores
Date: Fri, 20 Nov 2026 15:52:17 +0100
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAKFeAGsC/43Oy2rDMBAF0F8JWneKHpZsZ9X/KF3oMa5VHLlIi
 nAI/vcoLrSlBNzlZWbOnStJGD0mcjxcScTik59DDfLpQOyowzuCdzUTTrmiLe/BYcEJSspRpzS
 iP0GaLYJLGk4TcOqUltqZTnSkGp8RB79s/isJmCHgksnb1ySdzQfafOfvu6NPeY6X7ZXCtot/t
 hYGFAxK1TuNzHD6MvlwznEOfnl2uPUV/iP2VOyJvIqDobJrrWmUMo9E8Uvku6KoonNo9GBNb3T
 7SGy+Rcao3BObKlI+COuQ60Gzv+K6rjdTtHw24AEAAA==
X-Change-ID: 20260729-devel-vstrassheim-soce-dsa-ml-20d6a5adb838
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Lee Jones <lee@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Vasilij Strassheim <v.strassheim@linutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Benedikt Spranger <b.spranger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Add support for SoC-e Ethernet switch IP cores implemented in FPGAs.

The series introduces the SoC-e vendor prefix and Device Tree bindings,
an EtherType-based SDSA tagger, an MFD parent driver, an MDIO controller
driver, and a DSA switch driver.

During earlier review, Andrew suggested considering the generic
mdio-mux-mmioreg binding in v2 and an MFD parent in v3. Neither was
presented as a requirement, but I chose to follow both suggestions.

In v4, Rob questioned whether these abstractions fit this IP core. The
discussion did not reach a clear consensus on whether the MFD parent and
generic MDIO mux are the best fit yet.
This version fixes the binding errors and splits the MFD parent and
switch driver into separate patches to give both approaches another
chance.

The drivers use a memory-mapped control interface. The MFD parent
validates the core version and instantiates the child devices.

The switch driver configures the hardware DSA feature to isolate user
ports from each other and restrict them to exchanging frames with the
CPU port. Bridge forwarding is handled in software by the Linux bridge.
Hardware STP offload is not implemented. The driver disables the this
feature when present, leaving STP state handling to the Linux bridge.

Supported port interfaces are MII, GMII, RMII, and RGMII. On cores
synthesized with Port VLAN support, the driver programs VLAN membership
tables. Bridge VLAN filtering is not offloaded.

On cores synthesized without Port VLAN support, VLAN information is lost
when frames enter the switch through the CPU port and is not preserved
in the SDSA header. The driver therefore rejects direct VLAN uppers on
such cores. VLAN-aware software bridging is also unsupported on these
cores.

External MDIO outputs are exposed as separate logical MDIO buses sharing
the integrated MDIO controller. The controller supports Clause 22 and
Clause 45 transactions. The generic MMIO MDIO mux selects the external
bus through the upper halfword of the shared control register, while the
controller accesses the lower halfword.

The drivers were tested with a SoC-e MRS 25.01 IP core on a Xilinx
ZynqMP platform. The tested core was synthesized with three ports, DSA,
IEEE 802.1w RSTP, hybrid SVL/IVL MAC tables, port-based VLAN support,
QoS priorities, and statistics counters.

VLAN TX testing exercised in-band C-tags. TX VLAN offload is disabled
and cannot be enabled on this platform, so the accelerated SDSA-TCI TX
path was not tested.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
Changes in v5:
- Rebase onto net-next/main.
- Give the switch function its own reg property and map switch register
  blocks relative to that child resource. (Krzysztof)
- Order dt nodes by unit addresses. (Krzysztof)
- Rename the MFD parent in bindings example to ip-core.
- Split the MFD parent and DSA switch driver into separate patches.
- Add VLAN_HLEN to the SDSA tagger's needed_headroom. (sashiko).
- Remove writes to the per-VID "Untag Port VLAN" table. Keep the
  port-level UNTAG_PVID egress mode for PVID untagging. (sashiko).

- Link to v4: https://patch.msgid.link/20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de

Changes in v4:
- Rebase onto net-next/main.
- Introduce an MFD parent for core version validation and DT-based
  child-device creation. Keep feature detection and switch register
  mapping in the DSA driver. (Andrew)
- Split the combined switch binding into MFD-parent and switch-function
  bindings. Use soce,swip for the parent and
  soce,swip-switch-00-04-0c-10 for the switch function.
- Reference dsa.yaml#/$defs/ethernet-ports and remove the redundant
  local DSA port schema reference and property closure. (Rob)
- Update description for swip-switch-00-04-0c-10 compatible. (Rob,
  Andrew)
- Rename the MDIO compatible to soce,swip-mdio and update the examples.
- Move the switch driver directly into drivers/net/dsa/, rename it
  to soce-swip.c, and remove its subdirectory Kconfig and Makefile.
- Rename the DSA and MDIO Kconfig symbols to NET_DSA_SOCE_SWIP and
  MDIO_SOCE_SWIP. Make the MFD and MDIO options internal and select
  them from NET_DSA_SOCE_SWIP.
- Reserve and map switch register blocks separately instead of
  claiming the entire IP-core window, and validate their ranges
  against the parent resource.
- Restrict the MDIO control resource to its lower 16-bit halfword.
  Use readw_poll_timeout() and writew() instead of 32-bit
  read-modify-write accesses, leaving the mux selector untouched.
  (Andrew, sashiko-bot)
- Replace the MDIO mapping helper with named platform resource mappings
  and propagate mapping errors through IS_ERR()/PTR_ERR().
- Report feature-detection failures with dev_err_probe() and use
  explicit masks and FIELD_GET() for version extraction. (Andrew)
- Advertise half-duplex capabilities for RMII and RGMII in phylink.
- Disable all user ports during setup before configuring VLANs,
  disabling hardware STP, and enabling tagging. (sashiko-bot)
- Remove the unreachable bridge VLAN-filtering callback and associated
  PVID and untagged-mask tracking. Keep hardware ports VLAN-unaware
  with ingress filtering disabled. (sashiko-bot)
- Program standalone VLAN 1 membership explicitly and preserve it
  when explicit VLAN membership is removed. Explicit membership takes
  precedence over default untagging. (sashiko-bot)
- Wait for both VLAN WRITE bits to clear before changing the shared
  VID selector or data registers. On programming failure, restore
  the software shadow, attempt hardware rollback, log rollback
  failures, and return the original error. (sashiko-bot)
- Clear the VLAN membership shadow after a successful setup reset.
- Handle VID 0 before checking hardware VLAN support in both callbacks.
  Return -EINVAL for unsupported non-zero VID additions. (sashiko-bot)
- Set needs_standalone_vlan_filtering only when Port VLAN is present.
  Reject direct VLAN uppers otherwise through port_prechangeupper,
  while retaining software-bridge support.
- Rename vlan_lock to feature_lock, initialize it independently of
  VLAN support, and remove unnecessary setup locking. (Andrew)
- Push accelerated non-802.1Q VLAN tags in-band before inserting
  SDSA, and handle allocation failure. (sashiko-bot)
- Include linux/bitfield.h explicitly in the SDSA tagger and document
  the duplicated VLAN TCI in received frames.
- Replace SKB_DROP_REASON_HDR_TRUNC with the reason returned by
  pskb_may_pull_reason(), following API change in net-next.

- Link to v3: https://patch.msgid.link/20260923-devel-vstrassheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de

Changes in v3:
- Rebase onto net-next/main and update tag protocol number in dsa.h
- Drop the deprecated ports and port@ node names and keep only
  ethernet-ports and ethernet-port@ in the binding.
- Drop labels from the switch binding example.
- Rename the MDIO master to MDIO controller.
- New Patches 2 and 5: Move the integrated MDIO controller into a
  separate driver and add the corresponding binding, Kconfig entry, and
  build integration.
- Switch from internal MDIO multiplexing to the generic MMIO MDIO mux
  framework for selecting the synthesized external MDIO buses.
- Check that the MDIO controller is idle before programming a
  transaction and wait for completion afterward.
- Replace MDIO magic values and resource indices with named definitions.
- Reduce MDIO timeout from 1s to more reasonable 1ms.
- Remove inline declarations and unnecessary checks from the remaining
  MDIO code.
- Use mdio-mux-mmioreg for the 11-bit MDIO bus selector at bits 26:16
  and access it through the upper 16-bit half of the shared control
  register.
- Update the switch binding to describe the MDIO controller, generic
  MMIO mux, child buses, and PHY references.
- Remove struct soce_probe_desc, since only one register layout is
  supported.
- Reject configurations with fewer than three implemented ports.
- Add port enable and disable callbacks to prevent unmanaged forwarding
  after driver unbind or module removal.
- Disable tagging during teardown.
- Rename and regroup register field macros to identify their associated
  registers.
- Remove obsolete and irrelevant comments.
- Add new comments for proper documentation and clarity.
- Switch to dev_err_probe() to improve probe error reporting.
- Embed struct dsa_switch in struct soce_priv instead of allocating it
  separately.
- Remove the trailing comma after the sentinel entry in the match table.

Follow-up validation and feature work using a new IP core:
- New patch 7: Add basic VLAN hardware offload through
  port_vlan_filtering, port_vlan_add, and port_vlan_del.
- Warn when the Port VLAN feature is unavailable and reject VLAN
  configuration with netlink extended acknowledgements.
- Reset VLAN offloading configuration during teardown.
- New patch 8: Disable STP offloading, which is not supported by the
  initial driver.
- Improvements in SDSA tag handling:
  - Add specific skb drop reasons for malformed SDSA frames.
  - Restore VLAN metadata from the SDSA tag on receive and encode skb
    VLAN metadata into the SDSA tag on transmit.

- Link to v2: https://patch.msgid.link/20260903-devel-vstrassheim-soce-dsa-ml-v2-0-fb0587cb466b@linutronix.de

Changes in v2:
- Correctly use net-next prefix
- Rework the binding into a single MMIO-based switch node
- Model hardware MDIO outputs as separate logical MDIO buses
- Detect the switch version, features, and port count from hardware
- Drop incomplete STP, bridge, and FDB offloading
- Derive phylink capabilities from each port's phy-mode
- Harden MDIO access and SDSA receive validation
- Address binding, naming, and coding style review comments

Link to v1: https://patch.msgid.link/20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Vasilij Strassheim <v.strassheim@linutronix.de>
To: Simon Horman <horms@kernel.org>
To: Russell King <linux@armlinux.org.uk>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: mfd@lists.linux.dev
Cc: Martin Kaistra <martin.kaistra@linutronix.de>
Cc: Benedikt Spranger <b.spranger@linutronix.de>

---
Vasilij Strassheim (9):
      dt-bindings: vendor-prefixes: Add soce
      dt-bindings: net: Add SoC-e SWIP MDIO controller
      dt-bindings: net: dsa: Add SoC-e SWIP switch function
      dt-bindings: mfd: Add SoC-e SWIP parent
      net: dsa: Add tag handling for SoC-e switches
      net: mdio: Add SoC-e SWIP MDIO controller driver
      mfd: soce: Add SWIP core driver
      net: dsa: soce: Add basic support for SoC-e SWIP switch
      net: dsa: soce: Add VLAN membership table support

 .../devicetree/bindings/mfd/soce,swip.yaml         | 138 ++++
 .../bindings/net/dsa/soce,swip-switch.yaml         | 101 +++
 .../devicetree/bindings/net/soce,swip-mdio.yaml    |  47 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/soce-swip-core.c                       |  76 +++
 drivers/net/dsa/Kconfig                            |  15 +
 drivers/net/dsa/Makefile                           |   1 +
 drivers/net/dsa/soce-swip.c                        | 701 +++++++++++++++++++++
 drivers/net/dsa/soce-swip.h                        |  39 ++
 drivers/net/mdio/Kconfig                           |  10 +
 drivers/net/mdio/Makefile                          |   1 +
 drivers/net/mdio/mdio-soce.c                       | 213 +++++++
 include/net/dsa.h                                  |   2 +
 net/dsa/Kconfig                                    |   6 +
 net/dsa/Makefile                                   |   1 +
 net/dsa/tag_sdsa.c                                 | 170 +++++
 18 files changed, 1534 insertions(+)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20260729-devel-vstrassheim-soce-dsa-ml-20d6a5adb838

Best regards,
--  
Vasilij Strassheim <v.strassheim@linutronix.de>

