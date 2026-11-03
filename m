Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684853;
	b=CGZxKyUOgsMZdlZX2VBbe8B+yzKrtPI9QmCaUhHhwcRZ4BZ5RvDt5IucGoObSBpXUZwN
	 +EynUtzdAefX0D5MWAboerTokBzdrtWnIFb5bxqt6WblXAGqZN5JZpgQrhGL7TYSULIkB
	 KgJwXSRs59e6u/37wNNAzm7fpMaz2yUNoQuBm4aV6QNdjIzrmvgJ2EMV/91BLg5h5IN6K
	 hVS4TZZO/UuhHveNuJ9lJpa+Pku1+5JVn205AS6kJj8m1Qypf5IAGSqsVXIGm4WlBEgiN
	 /OChH7lBSXneuADpwU6IAVhEoa8rkZLE3gtfR5VNYcuu2qgN8Pr8dgigGmX4g46Jz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684853;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=1Q/peSdjNwnQCVADdc5m/UT+XRKJjpLqIpQOUotdz6M=;
	b=4H7Edn5qycazMYDvdmTkA4A/r6lXNb+j6nE/iceRuIFPnGApYWpZdSw+K7UbEFCLfi3I
	 yrZ4SIhVKLikg9MzwuAKLxvKrfoIDd2fTgkl5DY7Umj/sFpjEHmZLG8ujzbT0KoqK6hFG
	 WTUrkkX/cDFS1uQvRG3H29SxwoQU0ueHluz9eANVwrDtVta0/NZE/QEoglXKE/iXJNzuu
	 wXOTVJRndQbIubDvK8SA+Zwn1nGHSTQI2DdCBIDdJtw5LQR87qkkjVtbMHjZJgzf9Uv0X
	 rqU6Gy3MsQIxDYrz68h3UDumHqSi7DbgBxbP4oVajOIy/ht1aEOrInWlruW7F15J5/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101A606A324
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 05:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9101A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.98])
	by APP-01 (Coremail) with SMTP id qwCowADnE_5ndelqIhI0AA--.57481S2;
	Tue, 03 Nov 2026 13:47:21 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Date: Tue,  3 Nov 2026 13:47:16 +0800
Message-ID: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnE_5ndelqIhI0AA--.57481S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4rAFW8uFW5Ar4kWFy8Xwb_yoWDWFbEgF
	1xJFs0yan7AFWrtayvqryxJF1fJw4akwnrAw17CF43J34Sva4FqF97K3yYkrW8uF4fuF17
	Cas7X3y7XanrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

T-Head TH1520 has multiple system controllers for the "subsystems" on
the chip.

Add them to the syscon binding.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca22..b9d45f98345f2 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -126,6 +126,13 @@ properties:
               - st,spear1340-misc
               - stericsson,nomadik-pmu
               - starfive,jh7100-sysmain
+              - thead,th1520-syscon-ao
+              - thead,th1520-syscon-ap
+              - thead,th1520-syscon-dsp
+              - thead,th1520-syscon-misc
+              - thead,th1520-syscon-vo
+              - thead,th1520-syscon-vi
+              - thead,th1520-syscon-vp
               - ti,am62-opp-efuse-table
               - ti,am62-usb-phy-ctrl
               - ti,am625-dss-oldi-io-ctrl
-- 
2.56.0

